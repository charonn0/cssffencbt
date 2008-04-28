#tag ClassClass Sparkle	#tag Method, Flags = &h0		 Shared Sub CheckForUpdates(showUI as Boolean)		  'This function calls checkForUpdates: if showUI is TRUE or checkForUpdatesInBackground		  'if FALSE. The former initiates a check for an update with a full user interface.  The latter		  'performs the check without any UI.		  		  const functionName = "SUSparkleCheckForUpdates"		  dim SUSparkleCheckForUpdates as new BooleanDelegate(GetSparkleFunction(functionName))		  SUSparkleCheckForUpdates.Invoke showUI		  		exception oops as NilObjectException		  LogUnableToLoadFunction functionName		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub CheckWithInterval(interval as Double)		  'This function allows you to schedule a check to run every time interval. You can		  'pass 0 to this method to cancel a previously scheduled timer. You probably don't want		  'to call this directly: if you set a SUScheduledCheckInterval key in Info.plist or		  'the user defaults, Sparkle will set this up for you automatically on initialization. You might		  'just want to call this every time the user changes the setting in the preferences.		  		  		  const functionName = "SUSparkleCheckWithInterval"		  dim SUSparkleCheckWithInterval as new DoubleDelegate(GetSparkleFunction(functionName))		  SUSparkleCheckWithInterval.Invoke interval		  		exception oops as NilObjectException		  LogUnableToLoadFunction functionName		  		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function IsUpdateInProgress() As Boolean		  'This function returns TRUE if an update is in valid progress.  It returns FALSE if no update is		  'occurring.		  		  #if targetMacOS		    const functionName = "SUSparkleIsUpdateInProgress"		    dim SUSparkleIsUpdateInProgress as new None_BooleanDelegate(GetSparkleFunction(functionName))		    return SUSparkleIsUpdateInProgress.Invoke		  #endif		  		exception oops as NilObjectException		  LogUnableToLoadFunction functionName		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub CheckStatus()		  'This function begins a background version check that sends a kEventClassSparkle, 		kEventSparkleFoundVersion		  'event to the event target when the update is found.  Passing		  'NULL for the event target defaults to GetApplicationEventTarget().		  		  'Sparkle for REALbasic calls the FoundVersionHandler delegate to handle this event.		  		  		  const functionName = "SUSparkleCheckStatus"		  dim SUSparkleCheckStatus as new PtrDelegate(GetSparkleFunction(functionName))		  SUSparkleCheckStatus.Invoke nil		  		exception oops as NilObjectException		  LogUnableToLoadFunction functionName		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function HandleSparkleEvent(EventHandlerCallRef as Ptr, EventRef as Ptr, UserData as Ptr) As Integer		  soft declare function GetEventClass Lib CarbonFramework (inEvent as Ptr) as OSType		  soft declare function GetEventKind Lib CarbonFramework (inEvent as Ptr) as UInt32		  		  dim eventClass as String = GetEventClass(EventRef)		  dim eventKind as UInt32 = GetEventKind(EventRef)		  select case eventClass		  case kEventClassSparkle		    select case eventKind		    case kEventSparkleFoundVersion		      if Sparkle.FoundVersionHandler = nil then		        return eventNotHandledErr		      end if		      		      soft declare function GetEventParameter Lib CarbonFramework (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, ByRef outData as Boolean) as Integer		      		      dim isNew as Boolean		      dim OSError as Integer = GetEventParameter(EventRef, kEventParamSparkleIsNew, typeBoolean, nil, 4, nil, isNew)		      if OSError <> 0 then		        return eventNotHandledErr		      end if		      		      soft declare function GetEventParameter Lib CarbonFramework (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, outData as Ptr) as Integer		      		      dim versionInfoPtr as new MemoryBlock(4)		      OSError = GetEventParameter(EventRef, kEventParamSparkleVersion, typeCFStringRef, nil, 4, nil, versionInfoPtr)		      if OSError = noErr then		        soft declare function CFRetain lib CarbonFramework (p as Ptr) as CFStringRef		        dim versionInfo as CFStringRef = CFRetain(versionInfoPtr.Ptr(0))		        Sparkle.FoundVersionHandler.Invoke isNew, versionInfo		      elseIf OSError =  -9870 then //eventParameterNotFoundErr means that this optional parameter was not present		        Sparkle.FoundVersionHandler.Invoke isNew, ""		      else		        break		        System.Log System.LogLevelError, "Error " + Str(OSError) + " returned while handling Sparkle Carbon event."		      end if		      		      return noErr		      		    else		      return eventNotHandledErr		    end select		    		  case kEventClassCommand		    select case eventKind		    case kEventCommandProcess		      soft declare function GetEventParameter Lib CarbonFramework (inEvent as Ptr, inName as OSType, inDesiredType as OSType, outActualType as Ptr, inBufferSize as Integer, outBufferSize as Ptr, outData as Ptr) as Integer		      dim theHICommand as new MemoryBlock(14) //see Carbon Event Manager docs		      		      dim OSError as Integer = GetEventParameter(EventRef, kEventParamDirectObject, typeHICommand, nil, theHICommand.Size, nil, theHICommand)		      if OSError <> noErr then		        return eventNotHandledErr		      end if		      		      if theHICommand.UInt32Value(4) = OSTypeToUInt32(kHICommandSparkleQuitApplication) then		        if CancelQuitHandler <> nil and CancelQuitHandler.Invoke then		          return noErr //i.e. I have handled the event and so cancelled the quit		        else		          return eventNotHandledErr		        end if		      else		        //it's not for me		        return eventNotHandledErr		      end if		    else		      return eventNotHandledErr		    end select		  else		    return eventNotHandledErr		  end select		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Sub RegisterCarbonEventHandler()		  #if targetMacOS		    #if targetMachO		      soft declare function NewEventHandlerUPP Lib CarbonFramework (userRoutine as Ptr) as Ptr		    #else		      soft declare function NewEventHandlerUPP Lib "CarbonLib" (userRoutine as Ptr) as Ptr		    #endif		    		    soft declare function InstallEventHandler lib CarbonFramework (inTarget as Ptr, inHandler as Ptr, inNumTypes as Integer, inList as Ptr,  inUserData as Ptr, handlerRef as Ptr) as Integer		    		    		    dim theUPP as Ptr = NewEventHandlerUPP(AddressOf HandleSparkleEvent)		    if theUPP = nil then		      return		    end if		    		    soft declare function GetApplicationEventTarget lib CarbonFramework () as Ptr		    		    dim appTarget as Ptr = GetApplicationEventTarget		    if apptarget = nil then		      return		    end if		    		    		    const sizeOfEventTypeSpec = 8		    const EventCount = 2		    dim events as new MemoryBlock(sizeOfEventTypeSpec* EventCount)		    events.UInt32Value(0) = OSTypeToUInt32(kEventClassSparkle)		    events.UInt32Value(4) = kEventSparkleFoundVersion		    events.UInt32Value(8) = OSTypeToUInt32(kEventClassSparkle)		    events.UInt32Value(12) = kEventCommandProcess		    		    dim OSError as Integer = InstallEventHandler(appTarget, theUPP, EventCount, events, nil, nil)		    if OSError <> 0 then		      break		    end if		  #endif		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function OSTypeToUInt32(x as OSType) As UInt32		  dim char() as String = SplitB(x, "")		  return ((AscB(char(0))*256 + AscB(char(1)))*256 + AscB(char(2)))*256 + AscB(char(3))		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function GetSparkleFunction(functionName as String) As Ptr		  if functionName = "" then		    return nil		  end if		  		  if SparkleBundle = nil then		    return nil		  end if		  		  		  #if targetMacOS		    soft declare function CFBundleGetFunctionPointerForName lib CarbonFramework (bundle as Ptr, functionName as CFStringRef) as Ptr		    		    return CFBundleGetFunctionPointerForName(SparkleBundle, functionName)		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub Initialize(sparkleFramework as FolderItem = nil)		  SparkleBundle = CreateBundle(sparkleFramework)		  if SparkleBundle = nil then		    SparkleBundle = CreateBundle(FindSparkleFrameworkInPrivateFrameworks)		  end if		  if SparkleBundle = nil then		    SparkleBundle = CreateBundle(FindSparkleFrameworkInUserFrameworks)		  end if		  if SparkleBundle = nil then		    SparkleBundle = CreateBundle(FindSparkleFrameworkInLocalFrameworks)		  end if		  		  if SparkleBundle = nil then		    System.Log System.LogLevelError, "Sparkle initialization failed: unable to locate Sparkle.framework."		    return		  end if		  		  		  'This function initializes a global instance of SUCarbonUpdater and installs HICommand event		  'handlers the first time it is called.  It will start Sparkle as normal.  Additional calls to this		  'function are ignored.		  const functionName = "SUSparkleInitializeForCarbon"		  try		    dim SUSparkleInitializeForCarbon as new NoParamsDelegate(GetSparkleFunction(functionName))		    SUSparkleInitializeForCarbon.Invoke		    		    RegisterCarbonEventHandler		    		  catch noe as NilObjectException		    LogUnableToLoadFunction functionName		  end try		  		  		  		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function StringFromCFURL(theURL as Ptr) As String		  if theURL = nil then		    return ""		  end if		  		  #if targetMacOS		    soft declare function CFURLGetString lib CarbonFramework (anURL as Ptr) as Ptr		    		    dim thePath as Ptr = CFURLGetString(theURL)		    if thePath <> nil then		      soft declare function CFRetain lib CarbonFramework (cf as Ptr) as CFStringRef		      return CFRetain(thePath)		    else		      return ""		    end if		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function FindSparkleFrameworkInPrivateFrameworks() As FolderItem		  #if targetMacOS		    soft declare function CFBundleGetMainBundle lib CarbonFramework () as Ptr		    soft declare function CFBundleCopyBundleURL lib CarbonFramework (bundle as Ptr) as Ptr		    		    dim appBundleURL as Ptr = CFBundleCopyBundleURL(CFBundleGetMainBundle)		    if appBundleURL = nil then		      System.Log System.LogLevelError, "Unable to get a URL for application bundle."		      return nil		    end if		    		    soft declare function CFBundleCopyPrivateFrameworksURL lib CarbonFramework (bundle as Ptr) as Ptr		    		    dim PrivateFrameworksURL as Ptr = CFBundleCopyPrivateFrameworksURL(CFBundleGetMainBundle)		    if PrivateFrameworksURL = nil then		      GOTO ReleaseappBundleURL		    end if		    		    dim SparkleURL as String = StringFromCFURL(appBundleURL) + StringFromCFURL(PrivateFrameworksURL) + SparkleFramework		    dim theFramework as FolderItem		    try		      theFramework = GetFolderItem(SparkleURL, FolderItem.PathTypeURL)		      		    catch ufe as UnsupportedFormatException		      System.Log System.LogLevelError, "An UnsupportedFormatException was caught.  " + ufe.Message		      		    end try		    		    soft declare sub CFRelease lib CarbonFramework (cf as Ptr)		    		    		    ReleasePrivateFrameworks:		    if PrivateFrameworksURL <> nil then		      CFRelease PrivateFrameworksURL		      PrivateFrameworksURL = nil		    end if		    		    ReleaseappBundleURL:		    if appBundleURL <> nil then		      CFRelease appBundleURL		      appBundleURL = nil		    end if		    		    		    return theFramework		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function FindSparkleFrameworkInUserFrameworks() As FolderItem		  const kUserDomain = -32763		  dim userFrameworks as FolderItem = SparkleModule.FindFolder(kUserDomain, kFrameworksFolderType, false)		  if userFrameworks is nil then		    return nil		  else		    return userFrameworks.Child(SparkleFramework)		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function FindSparkleFrameworkInLocalFrameworks() As FolderItem		  const kLocalDomain = -32765		  dim userFrameworks as FolderItem = SparkleModule.FindFolder(kLocalDomain, kFrameworksFolderType, false)		  if userFrameworks is nil then		    return nil		  else		    return userFrameworks.Child(SparkleFramework)		  end if		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Sub LogUnableToLoadFunction(functionName as String)		  System.Log System.LogLevelError, "Unable to load function " + functionName + " from Sparkle.framework."		End Sub	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function UserDefault(key as String) As String		  #if targetMacOS		    soft declare function CFBundleGetBundleWithIdentifier lib "Carbon.framework" (bundleID as CFStringRef) as Ptr		    soft declare function CFBundleGetDataPointerForName lib "Carbon.framework" (bundle as Ptr, name as CFStringRef) as Ptr		    		    dim dataPtr as Ptr =  CFBundleGetDataPointerForName(CFBundleGetBundleWithIdentifier("com.apple.Carbon"), "kCFPreferencesCurrentApplication")		    if dataPtr = nil then		      System.Log System.LogLevelError, "Unable to get user default for key " + SingleQuote(key) + "."		      return ""		    end if		    		    soft declare function CFPreferencesCopyAppValue  lib "Carbon.framework" (key as CFStringRef, applicationID as Ptr) as Ptr		    		    dim prefValue as Ptr = CFPreferencesCopyAppValue(key, dataPtr.Ptr(0))		    dim theValue as String = GetStringValueFromCFPropertyListRef(prefValue)		    		    soft declare sub CFRelease lib CarbonFramework (cf as Ptr)		    		    if prefValue <> nil then		      CFRelease prefValue		    end if		    		    return theValue		    		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Sub UserDefault(key as String, assigns value as String)		  #if targetMacOS		    soft declare function CFBundleGetBundleWithIdentifier lib "Carbon.framework" (bundleID as CFStringRef) as Ptr		    soft declare function CFBundleGetDataPointerForName lib "Carbon.framework" (bundle as Ptr, name as CFStringRef) as Ptr		    		    dim p as Ptr =  CFBundleGetDataPointerForName(CFBundleGetBundleWithIdentifier("com.apple.Carbon"), "kCFPreferencesCurrentApplication")		    if p = nil then		      System.Log System.LogLevelError, "Unable to set user default for key " + SingleQuote(key) + "."		      return		    end if		    		    soft declare sub CFPreferencesSetAppValue  lib "Carbon.framework" (key as CFStringRef, value as CFStringRef, applicationID as Ptr)		    		    CFPreferencesSetAppValue key, value, p.Ptr(0)		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function SingleQuote(s as String) As String		  return "'" + s + "'"		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function GetStringValueFromCFPropertyListRef(prefValue as Ptr) As String		  if prefValue = nil then		    return ""		  end if		  		  		  #if targetMacOS		    soft declare function CFGetTypeID lib CarbonFramework (cf as Ptr) as Integer		    		    dim prefValueTypeID as Integer = CFGetTypeID(prefValue)		    		    soft declare function CFStringGetTypeID lib CarbonFramework () as Integer		    soft declare function CFBooleanGetTypeID lib CarbonFramework () as Integer		    soft declare function CFDateGetTypeID lib CarbonFramework () as Integer		    		    select case prefValueTypeID		    case CFStringGetTypeID		      soft declare function CFRetain lib CarbonFramework (p as Ptr) as CFStringRef		      		      return CFRetain(prefValue)		      		    case CFBooleanGetTypeID		      soft declare function CFBooleanGetValue lib CarbonFramework (b as Ptr) as Boolean		      		      if CFBooleanGetValue(prefValue) then		        return "true"		      else		        return "false"		      end if		      		    case CFDateGetTypeID		      soft declare function CFLocaleCopyCurrent lib CarbonFramework () as Ptr		      soft declare function CFDateFormatterCreate lib CarbonFramework (allocator as Ptr, locale as Ptr, dateStyle as Integer, timeStyle as Integer) as Ptr		      const kCFDateFormatterNoStyle = 0		      dim formatter as Ptr = CFDateFormatterCreate(nil, CFLocaleCopyCurrent, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle)		      if formatter = nil then		        return ""		      end if		      		      soft declare sub CFDateFormatterSetFormat lib CarbonFramework (formatter as Ptr, formatString as CFStringRef)		      		      CFDateFormatterSetFormat formatter, "yyyy-MM-dd HH:mm:ss"		      		      soft declare function CFDateFormatterCreateStringWithDate lib CarbonFramework (allocator as Ptr, formatter as Ptr, d as Ptr) as CFStringRef		      		      dim theValue as String = CFDateFormatterCreateStringWithDate(nil, formatter, prefValue)		      		      soft declare sub CFRelease lib CarbonFramework (cf as Ptr)		      CFRelease formatter		      return theValue		      		    else		      //CFNumber, CFData, CFArray, CFDictionary are the other documented possibilities		      soft declare function CFCopyDescription lib CarbonFramework (cf as Ptr) as CFStringRef		      System.Log System.LogLevelError, "I do not handle user defaults of this type.  " +  CFCopyDescription(prefValue)		      return ""		    end select		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Shared Function CreateBundle(f as FolderItem) As Ptr		  if f is nil then		    return nil		  end if		  		  #if targetMacOS		    soft declare function CFURLCreateWithString lib CarbonFramework (allocator as Ptr, URLString as CFStringRef, baseURL as Ptr) as Ptr		    		    dim fileURL as String = f.URLPath		    dim bundleURL as Ptr =  CFURLCreateWithString(nil, fileURL, nil)		    if bundleURL = nil then		      System.Log System.LogLevelError, "Unable to create a CFURL object for URL " + fileURL + "."		      return nil		    end if		    		    soft declare function CFBundleCreate lib CarbonFramework (allocator as ptr, bundleURL as Ptr) as Ptr		    		    dim p as Ptr = CFBundleCreate(nil, bundleURL)		    		    soft declare sub CFRelease lib CarbonFramework (cf as Ptr)		    CFRelease bundleURL		    		    return p		  #endif		End Function	#tag EndMethod	#tag Note, Name = Read Me		Sparkle for REALbasic		2/23/2008		Charles Yeomans				Sparkle for REALbasic is a wrapper for Sparkle for Carbon, which in turn is a wrapper for the Sparkle Cocoa library.  Sparkle does not do Windows.				<sparkle.andymatuschak.org/>				You should download Sparkle for Carbon <http://sparkle.downtowncode.com/SparkleForCarbon.html>		to get the Sparkle framework and the documentation, which I assume you will read.				This project serves as a sort of modest self-documentation for integrating Sparkle into your application.				You can now set the location of Sparkle.framework at runtime.  If you don't, Sparkle will look in the standard locations for it.  If it does not		find it anywhere, Sparkle will log this failure and do nothing.				You must set the user default SUFeedURL, or an NSException raised when you check for updates will cause your app to exit abruptly.  You can set it in Info.plist		<key>SUFeedURL</key>		<string>http://www.yourURL.com/path/to/appcastFile</string>				or you can set it at runtime by calling Sparkle.UserDefault.   You can also get and set other Sparkle user defaults this way.										Here is the contents of a sample file, appcast.xml, that you would put on your server at URL http://www.yourURL.com/path/to/appcast.xml .  It's cribbed from the Sparkle documentation.				<?xml version="1.0" encoding="utf-8"?>		<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:sparkle="http://		www.andymatuschak.org/xml-namespaces/sparkle">		<channel>		<title>Some App Changelog</title>		<link>http://www.declareSub.com/appcast.xml</link>		<description>Most recent changes with links to updates.</description>		<language>en</language>		<item>		<title>Version 2.0 (2 bugs fixed; 3 new features)</title>		<description>http://www.declareSub.com/index.html</description>		<pubDate>WTue, 21 Aug 2007 11:59:48 -0400</pubDate>		<enclosure url="http://www.declareSub.com/SparkleTest_2.0.zip" length="2883277"		type="application/octet-stream"/>		</item>		</channel>		</rss>				Finally, you should build an update archive, and put it on your server (I note that localhost should work for testing; use that web server on your Mac).  		I used a .zip archive, but the Sparkle documentation says that any of zip, tar, tbz, tgz, or dmg is fine.	#tag EndNote	#tag Property, Flags = &h21		Private Shared SparkleBundle As Ptr	#tag EndProperty	#tag Property, Flags = &h0		Shared FoundVersionHandler As SparkleFoundVersionDelegate	#tag EndProperty	#tag Property, Flags = &h0		Shared CancelQuitHandler As SparkleCancelQuitDelegate	#tag EndProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			Dim pList as FolderItem = App.ExecutableFile.Parent.Parent.Child("Info.plist")			Dim inStream as TextInputStream = pList.OpenAsTextFile			Dim pos as UInt64			Dim value as String			pos = InStr(inStream.ReadAll, "<key>SUCheckAtStartup</key>")						If pos = 0 Then			Return True			End If						inStream.PositionB = Pos			value = inStream.ReadLine						//Value now = the target value.			value = inStream.ReadLine						inStream.Close						If Value = "<false/>" Then			Return False			Else			Return True			End If			End Get		#tag EndGetter		#tag Setter			Set			'================================================			Dim pList as FolderItem = App.ExecutableFile.Parent.Parent.Child("Info.plist")			Dim inStream as TextInputStream = pList.OpenAsTextFile			Dim pos as UInt64			Dim contents, result as String			Dim outStream as TextOutputStream			'================================================						//read the entire file to a string.			contents = inStream.ReadAll			inStream.Close						//find the area we need to change and replace it.			If CheckOnStartup = True Then			If Value = True Then			Return			Else			pos = InStr(contents, "<key>SUCheckAtStartup</key>")			If pos = 0 Then			//We need to write both lines 			result = contents + EndOfLine + "<key>SUCheckAtStartup</key>" + EndOfLine + "<false/>"			Else			Result = contents.Replace("<true/>", "<false/>")			End If			End If			Else			If Value = True Then			pos = InStr(contents, "<key>SUCheckAtStartup</key>")			If pos = 0 Then			//We need to write both lines the line			result = contents + EndOfLine + "<key>SUCheckAtStartup</key>" + EndOfLine + "<true/>"			Else			Result = contents.Replace("<false/>", "<true/>")			End If			Else			Return			End If			End If						//write the result			outStream = pList.CreateTextFile			outStream.Write(result)			End Set		#tag EndSetter		Shared CheckOnStartup As Boolean	#tag EndComputedProperty	#tag Constant, Name = kEventClassSparkle, Type = String, Dynamic = False, Default = \"Sprk", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventSparkleFoundVersion, Type = Double, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventParamSparkleVersion, Type = String, Dynamic = False, Default = \"sVrs", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventParamSparkleIsNew, Type = String, Dynamic = False, Default = \"sNew", Scope = Private	#tag EndConstant	#tag Constant, Name = CarbonFramework, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Private	#tag EndConstant	#tag Constant, Name = kFrameworksFolderType, Type = String, Dynamic = False, Default = \"fram", Scope = Private	#tag EndConstant	#tag Constant, Name = SparkleFramework, Type = String, Dynamic = False, Default = \"Sparkle.framework", Scope = Private	#tag EndConstant	#tag Constant, Name = typeBoolean, Type = String, Dynamic = False, Default = \"bool", Scope = Private	#tag EndConstant	#tag Constant, Name = typeCFStringRef, Type = String, Dynamic = False, Default = \"cfst", Scope = Private	#tag EndConstant	#tag Constant, Name = eventNotHandledErr, Type = Double, Dynamic = False, Default = \"-9874", Scope = Private	#tag EndConstant	#tag Constant, Name = noErr, Type = Double, Dynamic = False, Default = \"0", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventClassCommand, Type = String, Dynamic = False, Default = \"cmds", Scope = Private	#tag EndConstant	#tag Constant, Name = kHICommandSparkleQuitApplication, Type = String, Dynamic = False, Default = \"sQAP", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventCommandProcess, Type = Double, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = typeHICommand, Type = String, Dynamic = False, Default = \"hcmd", Scope = Private	#tag EndConstant	#tag Constant, Name = kEventParamDirectObject, Type = String, Dynamic = False, Default = \"----", Scope = Private	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass