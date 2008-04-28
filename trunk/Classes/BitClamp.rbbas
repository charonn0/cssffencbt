#tag ClassProtected Class BitClampInherits Application	#tag Event		Sub Close()		  //Save License data if necessary.		  #If Not DebugBuild		    Dim Nigel as New DGLicenser		    Nigel.newSave		  #endif		  		  //Delete temporary items.		  TemporaryFolder.Child("BitClamp.cdx").Delete		  TemporaryFolder.Child("tempBitClampLicense.bclicense").Delete		  		End Sub	#tag EndEvent	#tag Event		Sub Open()		  #pragma DisableBackgroundTasks 'Speed up		  System.Log(System.LogLevelNotice, "BitClamp loading started...")		  //Register MBS Plugins		  if not registerMBSPlugin("Daniel Greg", "MBS MacOSX", 200807,-976194459) then		    MsgBox "MBS Plugin serial not valid?"		  end if		  if not registerMBSPlugin("Daniel Greg", "MBS Picture", 200807,-269160742) then		    MsgBox "MBS Plugin serial not valid?"		  end if		  		  System.Log(System.LogLevelNotice, "Plugins registered.")		  		  System.Log(System.LogLevelNotice, "Animation Core Started.")		  		  //Load Licensing details by running the thread.		  '#If NOT DebugBuild ##		  Dim Nigel as New DGLicenser		  Nigel.OpeningCheck		  '#else		  'TrialMode = False		  '#endif		  		  //initialize Sparkle		  #If TargetMacOS AND Not DebugBuild Then		    InitializeSparkle		  #EndIf		  //Read in preferences		  ReadPrefs		  		  System.Log(System.LogLevelNotice, "Preferences read.")		  		  //Delete temporary items. - Avoids some problems		  TemporaryFolder.Child("BitClamp.cdx").Delete		  TemporaryFolder.Child("tempBitClampLicense.bclicense").Delete		  		  FileRemoveItem.Enabled = False		  CurrentEncryptionType = Preferences.DefaultEncryptionType		  		  		End Sub	#tag EndEvent	#tag Event		Function UnhandledException(error As RuntimeException) As Boolean		  Beep		  MsgBox "There was an error! Please report:" + EndOfLine + join(GetErrorStack(error),EndOfLine) + EndOfLine + "Thanks for your help."		  Return True		End Function	#tag EndEvent	#tag Event		Function CancelClose() As Boolean		  //If there is encryption/decryption is in process.		  If wMain.WindowStatus = 3 Then		    //Create message dialogue and ask the user if they are sure they wish to quit.		    Dim d as new MessageDialog		    Dim b as new MessageDialogButton		    		    d.Icon = MessageDialog.GraphicCaution		    d.ActionButton.Caption = "Quit"		    d.CancelButton.Visible = True		    d.Message = "Encryption/decryption is in process are you sure you want to quit?"		    d.Explanation = "Quitting now will cancel the current process."		    b = d.ShowModal		    		    Select Case b		    Case d.ActionButton		      Return False		    Case d.CancelButton		      Return True		    End Select		  End If		  		  //Save any log data.		  If NOT SavePasswordLog Then		    //Error occured		    Return True		  Else		    Return False		  End If		  		End Function	#tag EndEvent	#tag Event		Sub OpenDocument(item As FolderItem)		  //A file is dropped on the icon.		  checker = NEW BCTagger		  If  NOT checker.CheckTag(item) Then //If the file doesnt have a tag.		    Items.Append(item)		    wMain.bcdList.sbScroll = wMain.sbwMain 'Avoids the nil object		    wMain.Transition		  Else		    If Checker.kFileTypeVersion > BitClamp.kFileTypeVersion Then		      Beep		      MsgBox("This file was produced by a later version of BitClamp and cannot be decrypted by this version.")		    Else		      Items.Append(item)		      wMain.bcdList.sbScroll = wMain.sbwMain		      wMain.DecryptTransition		    End If		  End If		  		End Sub	#tag EndEvent#tag MenuHandler		Function FileAboutBitClamp() As Boolean Handles FileAboutBitClamp.Action			wAbout.Show(true)		End Function#tag EndMenuHandler#tag MenuHandler		Function FileKey() As Boolean Handles FileKey.Action			wRegister.show		End Function#tag EndMenuHandler#tag MenuHandler		Function HelpReportBug() As Boolean Handles HelpReportBug.Action			MsgBox("You will now be taken to our online bug tracking system, you will be automatically logged in anonymously where you can report a bug with the 'report issue' link.")			ShowURL("http://www.crimsonskysoftware.com/mantis")			Return True					End Function#tag EndMenuHandler#tag MenuHandler		Function HelpUserGuide() As Boolean Handles HelpUserGuide.Action			Dim ug As FolderItem = GetFolderItem(Preferences.UserGuidePath, FolderItem.PathTypeShell)						If NOT ug.Exists Then			dim r as NavigationDialogResultMBS						dim n as NavigationDialogMBS			dim o as NavigationDialogOptionsMBS						const kNavAllowPreviews             = &h00000040 // allow preview to show			const kNavSupportPackages           = &h00001000 // recognize file system packages, v2.0 or greater									o=new NavigationDialogOptionsMBS			o.Flags=kNavAllowPreviews+kNavSupportPackages			o.Message="Please locate the User Guide."						n=new NavigationDialogMBS			n.StartLocation=GetFolderItem("")			n.Options=o			n.ShowChooseFileDialog(nil)						r=n.Result			If r = NIL Then Return False			ug = r.File			Preferences.UserGuidePath = ug.ShellPath			End If						ug.Launch		End Function#tag EndMenuHandler#tag MenuHandler		Function HelpVisitWebsite() As Boolean Handles HelpVisitWebsite.Action			ShowURL("http://www.fastforwardsw.com/products/bitclamp")		End Function#tag EndMenuHandler	#tag Method, Flags = &h0		Function CPPDemangle(name as string) As string		  //! Demangles a C++ function name. Returns an empty string on failure.		  //! Only works on Mac OS X.		  		  #if targetMacOS		    declare function __cxa_demangle lib "/usr/lib/libstdc++.6.dylib" ( name as CString, _		    outBuffer as ptr, outLength as ptr, byref outState as integer ) as CString		    declare sub free lib "System" ( value as CString )		    const kStateSuccess = 0		    		    dim state as integer		    dim demangledString as CString = __cxa_demangle( name, nil, nil, state )		    		    if state = kStateSuccess then		      // create our RB string, then free the string demangle gave us		      dim result as string = demangledString		      free( demangledString )		      		      return result		    end if		  #else		    Return name		  #endif		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function GetErrorStack(err as RuntimeException) As string()		  //! Gets the stack trace for our exception. This differs from		  //! RuntimeException.stack in that it demangles C++ names.		  		  // this can crash in some cases, giving us a completely useless crash log		  // <rb-feedback://keeqghwg>, hopefully this will be fixed someday...		  dim stack() as string = err.stack		  dim cleanedStack() as string		  		  // the order of RB's "for each" isn't defined <rb-feedback://hdcdbgfi>, so we have		  // to use a normal loop		  for i as integer = 0 to stack.ubound		    dim name as string = stack( i )		    dim demangledName as string = cppDemangle( name )		    		    if demangledName <> "" then		      cleanedStack.append( demangledName )		    else		      cleanedStack.append( name )		    end if		  next		  		  return cleanedStack		End Function	#tag EndMethod	#tag Note, Name = Release Notes		1.5.1		[NEW] Refresh button added to password generator.		[NEW] You now have the option to save files in the same directory as the first file in the encryption list.		[Change] Nag window is now displayed on launch if you have not registered the application.		[Fix] Less CPU usage. (Change in AnimationKit).		[Fix] The preferences will no longer allow you to always mimic nothing, causing nil object errors.		[Fix] BitClamp will now check to make sure that the file you wish to mimic exists before mimicking and potentially erroring.				1.5 (full release notes)		[NEW] File mimicking - this is a major new feature, see screencasts for further information.		[NEW] Encrypted files can now overwrite the original files as opposed to being saved to a constant location.		[NEW] Covert file names can now be set in the password stage.		[NEW] Strong password generator.		[NEW] Password log.		[NEW] BitClamp can be forced to encrypt a file by holding the command key as you drag it in to the window.		[Change] Better smooth resizing and animations.		[Change] Optimizations - better memory and CPU usage		[Change] Better Sparkle Implementation.		[Change] MUCH better password strength algorithm (this has been greatly improved).		[Change] New file type, much improving performance, especially on large files.		[Change] More descriptive error reporting.		[Change] Bugs are now reported through the Mantis bug tracker installation.		[Change] Preferences are now saved on the closing of the preferences window not the shutting down of the app itself.		[Change] Optimized some menubar memory usage.		[Change] Moved OK box in the change encryption window to the center.		[Fix] The password generator and password strength windows now detect how much room is left on the current screen and display themselves accoringly.		[Fix] Possible UE0 error on decryption.		[Fix/Workaround] Sheet windows now accept clicks in 10.5.2, as I have removed all floating windows.		[Fix] Rare UE0 error on cancel.		[Fix] Fixed a line of stray pixels on the main screen.		[Fix] BitClamp no longer claims its finished when it is still unarchiving.		[Fix] Better code to dynamically change the size of the window when obtaining a password.		[Fix] BitClamp now checks window size on launch - avoiding problems of it disappearing if you change screen size.		[Fix] Preferences now load the destination folder correctly.		[Fix] Cancelling a decrypt now returns to the first window state.		[Fix] Cancelling the process when it cannot be cancelled no longer resets the UI.		[Fix] Renaming BitClamp no longer causes Growl not to load and the app to crash.		[Fix] Scrolling the encryption list with the mouse weel now works.		[Fix] Password strength window only shows when encrypting.		[Fix] Changing the default encryption menthod now correctly changes the current encryption method.		[Fix] BitClamp no longer leaves temporary, unencrypted, files on the HD which are can be later "recovered" by the OS.		[Fix] Updated credits.				1.5		[Fix] BitClamp now stores and loads licensing data correctly. (Mantis ID# 0000029)		[Fix] BitClamp no longer leaves temporary items to be "recovered". (Mantis ID# 0000031)				1.5(Beta 8)		[Fix] A potential bug that would stop BitClamp recognizing Mimicked files.		[Fix] BitClamp now acknowledges registration straight from the preferences window. (Mantis ID# 0000026)				1.5(Beta 7)		[Fix] BitClamp no longer registers Growl unless it is already registered.		[Fix] BitClamp no longer leaves temporary, unencrypted, files on the HD which are later "recovered" by the OS. (Mantis ID# 0000022)		[Fix] Top of checkboxes can no longer be seen in the Password Generator.		[Change] Moved OK box in the change encryption window to the center. (Mantis ID# 0000025)				1.5(Beta 6)		[Fix] More detailed error message when trying to decrypt a corrupted file. (Mantis ID# 0000021)		[Fix] Password strength window is no longer shown during decryption. (Mantis ID# 0000020)		[Fix] BitClamp can now compress and encrypt as before. (Mantis ID# 0000017)		[Fix] BitClamp now closes the password log and closes correctly. (Mantis ID# 0000018)		[Fix] Updated credits.				1.5(Beta 5)		[NEW] Log password may now be saved to the keychain.		[NEW] BitClamp can be forced to encrypt a file by holding option as you drag it in to the window.		[Fix] BitClamp now saves the data to be logged whether the window is open or not.		[Fix] Updated credits.		[Fix] Lifts 2GB file limit, new file type in place. NOTE: test this hard, I am expecting bugs, although there are no known ones.		[Change] Preferences are now saved on the closing of the preferences window not the shutting down of the app itself.				1.5(Beta 4)		[Fix] Refusing to cancel when you press the cancel button even though it can.		[Fix] Default file extension disappearing in preferences window. (Mantis ID# 0000008)		[Fix] Crash when attempting to encrypt files over 4 gigs. (Mantis ID# 0000009)		[Fix] Immediate crash of application on PPC, Tiger. (Mantis ID# 0000010)		[Fix/Workaround] Sheet windows now accept clicks in 10.5.2, as I have removed all floating windows.		[Change] Optimized some menubar memory usage.		[Known Issue] BitClamp now limits encrypts to 2GBs. This is a zip issue, I am developing my own archive format that will remove this problem.				1.5(Beta 3)		[NEW] Fill and encrypt button on password generator is now functional.		[NEW] Added cotextual menu to password log to allow the copying of passwords aswell as auto filling and submitting.		[Fix] Password strength window only shows when encrypting.		[Fix] Scrolling the encryption list with the mouse weel now works.		[Fix] Changing the default encryption menthod now correctly changes the current encryption method.		[Change] Updated the report bug menu item to reflect the new bug tracker.				1.5(Beta 2)		[Fix] Renaming BitClamp no longer causes Growl not to load and the app to crash.		[Fix] UI issues with the password enterring window in its various forms.		[Fix] Registration details are now correctly displayed.		[Fix] Cancelling the process when it cannot be cancelled no longer resets the UI.		[Fix] Uses the correct, beta, appcast feed.				1.5 (Beta 1)		[Fix] Preferences now load the destination folder correctly.		[Fix] Fixed a line of stray pixels on the main screen.		[Fix] The password generator and password strength windows now detect how much room is left on the current screen and display themselves accoringly. 		[Fix] BitClamp's nag window now goes away when you want it to.		[Change] MUCH better password strength algorithm (this has been greatly improved).		[Change] Improved preferences UI.		[NEW] New strong password generator.		[NEW] Password Logging.		[Known Issue] Renaming the app causes it not to launch. I know the cause and expect a fix in the next release.		[Known Issue] Resizing the password log is slightly borked, expect a fix next release.				1.2 Beta 5 (RC 2)		[Fix] Crash on launch.		[Change] More robust method file mimicking.				1.2 Beta 4 (RC1)		[Fix] BitClamp now checks window size on launch - avoiding problems of it disappearing if you change screen size.		[Change] Better Sparkle Implementation.				1.2 Beta 3		[Fix] Possible UE0 error on decryption.		[Fix] No more barber poles when you have finished encrypting.		[Fix] UE0 error on cancel.		[Fix] BitClamp no longer claims its finished when it is still unarchiving.		[Fix] Better code to dynamically change the size of the window when obtaining a password.		[NEW] Mimicked files can now be decrypted :-).				1.2 Beta 2						1.2 Beta 1		[Fix] Cancelling a decrypt now returns to the first window state.		[NEW] Encrypted files can now overwrite the original files as opposed to being saved to a constant location.		[NEW] Covert file names can now be set in the password stage.		[Change] Better smooth resizing and animations.		[Change] Optimizations - better memory and CPU usage				1.1.3		[Fix] Preferences now correctly load the desired destination.				1.1.1		[Fix] Changed error an message to reflect new fixes.		[Fix] Now correctly loads default encryption type.		RELEASED		Beta 4		[Fix] Should not show the truncated names error.		[Fix] Preferences are now loaded and saved correctly.		[Fix] Now launches in a folder with a space in the name.				Beta 3		[NEW] Cancelling during the key entering stage will now return you to the encryption list editor as opposed to right back to the start.		[Fix] Change algorithm window now reflects new algorithms (again).		[Fix] Key no longer requires confirmation when decrypting.		[Fix] Assertion errors are fixed.		[Fix] Buy now URL now takes you to the online store.		[Internal Modification] Changes made to the decryption process BE CAREFULL WHEN TESTING, let me know if you find any bugs.		BACK UP YOUR FILES WHEN USING THIS BETA				1.1		[NEW] Optional password confirm field. The default is that this is set to be on.		[NEW] New improved (backwards compatible) algorithms 256 bit AES and Serpent as well as 448 Bit Blowfish. Should be just as fast as before.		[Internal Modification] Completely new preferences system (backwards compatible).						1.03		[Fix] Now checks that Growl is installed. Bundle size has been increased due to now carrying the growl framework.		[Internal Modification] About window code has been changed and optimized.		[Internal Modification] Sparkle AppCast has been moved to a feedburner feed so I can get some basic statistics.				1.02		[Fix] Occasional fault where BitClamp could not decompress a file. ("Missing plugin error message").				1.01		[NEW] Added new error dialog when running in folders that contain spaces in the name. (Known issue)		[Fix] Updated URLs		[Fix] Using an incorrect serial no longer causes the trial to expire.		[Fix] The decryption confirmation preference now works as expected.		[Known Issue] Very occasionally BitClamp seems to not decrypt a compressed file - We have isolated this and are working on a fix.		In the meantime simply re-encrypt the file to solve the problem				1.0 (2)		[Fix] Cancel button defaults now happen correctly		[Fix] Registration UI and system kinks.		[NEW] License now appears on first run and must be agreed with to use the program.		[NEW] Position of the window is now remembered on launch.e				1.0		[Fix] Preferences window now resizes correctly on returning to the "general" preference pane.		[Fix] Path of the default saving location now auto sizes and displays correctly.		[Fix] Major fault in saving files. Now files dont get increasingly bigger.		[NEW] Extension and file name are now selected seperately.		[NEW] Growl preference pane changed to notification preference pane.		[NEW] Users can now choose whether or not the dock icon is bounced after a task is completed.		[NEW] License files are now encrypted as well as hidden.		[NEW] Added check to see if a key was actually supplied.		[NEW] Compression of BitClamp encrypted files is now optional.		==============================================================		0.21		[Fix] Improved registration preference pane.		[Fix] Temporary files are now stored in the correct temporary directory.		[Fix] Optimised startup and cpu usage.		[Fix] Progress bar now stays full after a process.		[NEW] Dock icon now bounces once when a process is completed.		[NEW] Added contextual menus.		[NEW] Duplicate items will no longer be added to the UI.		[NEW] eSellerate registration now implemented.		=================================================================		0.17		[NEW] Added AES encryption (supposedly the best in the world).		[NEW] Improved security of file type 		[IMPORTANT] any files encrypted with the old version will now no-longer decrypt. I assumed this would be fine as its Beta.				0.16		[Fix] Sorted out the menu bar - now it is much more functional.		[Fix] Removed unused images.		[Change] Changed some keyboard shorcuts.		================================================================		0.15		[NEW] Added some more contextual menus, some are still unfunctional (wanted to get this fix out). 		[Fix] The "change encryption type" window now has correct radio button values.		[Fix] Changed size of updates preference window.		[Fix] Decrypted files now turn up where theyre meant to.		[Change] Adjusted credits.				=====================================================================		0.14		=====================================================================		[Removed] Date of the last check for updates has been removed. Saves a lot of initialization code, therefore improves on performance and its not really needed.		[Fix] New AppCast feed, another attempt at getting the versioning correct.		[Fix] Check for updates on starup preference is now funcitonal.		[IMPORTANT] The preferences file must be deleted to avoid a crash (due to a new format)		To locate the preference file: [your-username]/Library/Preferences/BitClamp.BC_PREFS		If you experience a crash please try deleting the preference file. 				=============================================================		0.13		=============================================================		[FIX] PPC fix.		=========================================================================		0.12		=========================================================================		[FIX] Reduced bundle size by removing defunct image files.		[NEW] Added file menu and appropriate menu-items.		[FIX] You can now no-longer encrypt nothing.		[NEW]Added BETA registering.	#tag EndNote	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"	#tag EndConstant	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"	#tag EndConstant	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"	#tag EndConstant	#tag Constant, Name = kFileTypeVersion, Type = Double, Dynamic = False, Default = \"3", Scope = Public	#tag EndConstant	#tag Constant, Name = IsBetaBuild, Type = Boolean, Dynamic = False, Default = \"False", Scope = Public	#tag EndConstant	#tag Constant, Name = kVersionKey, Type = String, Dynamic = False, Default = \"BitClamp1.0", Scope = Public	#tag EndConstant	#tag ViewBehavior	#tag EndViewBehaviorEnd Class#tag EndClass