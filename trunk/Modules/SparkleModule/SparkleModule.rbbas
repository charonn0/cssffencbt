#tag ModuleProtected Module SparkleModule	#tag DelegateDeclaration, Flags = &h21		Private Delegate Sub NoParamsDelegate()	#tag EndDelegateDeclaration	#tag DelegateDeclaration, Flags = &h21		Private Delegate Sub BooleanDelegate(b as Boolean)	#tag EndDelegateDeclaration	#tag DelegateDeclaration, Flags = &h21		Private Delegate Sub PtrDelegate(p as Ptr)	#tag EndDelegateDeclaration	#tag Method, Flags = &h21		Private Function GetFolderItemFromFSRef(theFSRef as FSRef) As FolderItem		  #if targetMacOS		    soft declare function FSGetCatalogInfo lib CarbonFramework (ByRef ref as FSRef, whichInfo as Uint32, ByRef catalogInfo as FSCatalogInfo, outName as Ptr, fsSpec as Ptr, ByRef parentRef as FSRef) as Int16		    		    dim parentRef as FSRef		    dim catalogInfo as FSCatalogInfo		    dim OSError as Int16 = FSGetCatalogInfo(theFSRef, kFSCatInfoVolume + kFSCatInfoParentDirID, catalogInfo, nil, nil, parentRef)		    if OSError <> 0 then		      return nil		    end if		    		    dim parentDirectoryID as UInt32 = catalogInfo.parentDirID		    If parentDirectoryID = fsRtParID then //is root directory, and parentRef is invalid		      dim theVolume as FolderItem		      for i as Integer = VolumeCount - 1 downto 0		        dim v as FolderItem = Volume(i)		        if v is nil then		          continue		        end if		        if v.MacVRefNum = catalogInfo.volume then		          theVolume = v		          exit		        end if		      next		      return theVolume		    else		      dim f as FolderItem = GetFolderItemFromFSRef(parentRef)		      if f Is nil then		        return nil		      end if		      		      soft declare function FSGetCatalogInfo lib CarbonFramework (ByRef ref as FSRef, whichInfo as Uint32, catalogInfo as Ptr, ByRef outName as HFSUniStr255, fsSpec as Ptr, parentRef as Ptr) as Int16		      		      dim itemName as HFSUniStr255		      OSError = FSGetCatalogInfo(theFSRef, kFSCatInfoNone, Nil, itemName, Nil, Nil)		      if OSError <> 0 then		        return nil		      end if		      return f.TrueChild(StringValue(itemName))		    end if		  #endif		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function StringValue(s as HFSUniStr255) As String		  dim data as String = s.StringValue(not targetBigEndian)		  return ConvertEncoding(DefineEncoding(MidB(data, 3, 2*s.length), Encodings.UTF16), Encodings.UTF8)		  		  		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function FindFolder(location as Integer, folderType as OSType, create as Boolean) As FolderItem		  #if TargetMacOS		    soft declare function FSFindFolder Lib CarbonFramework (vRefNum as Int16, folderType as OSType, createFolder as Boolean, ByRef outRef as FSRef) as Int16		    		    dim theRef as FSRef		    dim OSErr as Int16 = FSFindFolder(location, folderType, create, theRef)		    if OSErr = 0 then		      return GetFolderItemFromFSRef(theRef)		    else		      return nil		    end if		  #endif		  		End Function	#tag EndMethod	#tag DelegateDeclaration, Flags = &h21		Private Delegate Sub DoubleDelegate(d as Double)	#tag EndDelegateDeclaration	#tag DelegateDeclaration, Flags = &h21		Private Delegate Function None_BooleanDelegate() As Boolean	#tag EndDelegateDeclaration	#tag Method, Flags = &h21		Private Function CFRangeMake(loc as Int32, len as Int32) As CFRange		  dim r as CFRange		  r.location = loc		  r.length = len		  return r		End Function	#tag EndMethod	#tag DelegateDeclaration, Flags = &h0		Delegate Sub SparkleFoundVersionDelegate(isNew as Boolean, version as String)	#tag EndDelegateDeclaration	#tag DelegateDeclaration, Flags = &h21		Private Delegate Function SparkleCancelQuitDelegate() As Boolean	#tag EndDelegateDeclaration	#tag Constant, Name = CarbonFramework, Type = String, Dynamic = False, Default = \"Carbon.framework", Scope = Private	#tag EndConstant	#tag Constant, Name = kFSCatInfoVolume, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Private	#tag EndConstant	#tag Constant, Name = kFSCatInfoParentDirID, Type = Double, Dynamic = False, Default = \"&h00000008", Scope = Private	#tag EndConstant	#tag Constant, Name = fsRtParID, Type = Double, Dynamic = False, Default = \"1", Scope = Private	#tag EndConstant	#tag Constant, Name = kFSCatInfoNone, Type = Double, Dynamic = False, Default = \"&h00000000", Scope = Private	#tag EndConstant	#tag Structure, Name = FSRef, Flags = &h21		hidden(79) as UInt8	#tag EndStructure	#tag Structure, Name = FSCatalogInfo, Flags = &h21		nodeFlags as UInt16		  volume as Int16		  parentDirID as UInt32		  nodeID as UInt32		  sharingFlags as UInt8		  userPrivileges as UInt8		  reserved1 as UInt8		  reserved2 as UInt8		  createDate as UTCDateTime		  contentModDate as UTCDateTime		  attributeModDate as UTCDateTime		  accessDate as UTCDateTime		  backupDate as UTCDateTime		  permissions(3) as UInt32		  finderInfo(15) as UInt8		  extFinderInfo(15) as UInt8		  dataLogicalSize as UInt64		  dataPhysicalSize as UInt64		  rsrcLogicalSize as UInt64		  rsrcPhysicalSize as UInt64		  valence as UInt32		textEncodingHint as UInt32	#tag EndStructure	#tag Structure, Name = HFSUniStr255, Flags = &h21		length as UInt16		unicode(254) as UInt16	#tag EndStructure	#tag Structure, Name = UTCDateTime, Flags = &h21		highSeconds as UInt16		  lowSeconds as UInt32		fraction as UInt16	#tag EndStructure	#tag Structure, Name = CFRange, Flags = &h21		location as Int32		length as Int32	#tag EndStructure	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule