#tag WindowBegin Window wPasswordLog   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "True"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   422   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   326659859   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   0   Resizeable      =   "True"   Title           =   "Password Log"   Visible         =   "True"   Width           =   642   Begin DGlogListBox lbLog      AutoDeactivate  =   "True"      AutoHideScrollbars=   "True"      Bold            =   ""      ColumnCount     =   3      ColumnsResizable=   "True"      ColumnWidths    =   80,300      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   -1      Enabled         =   True      EnableDrag      =   ""      EnableDragReorder=   "False"      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   "True"      HeadingIndex    =   -1      Height          =   388      HelpTag         =   ""      Hierarchical    =   "False"      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   "Date	File(s) Encrypted	Password"      Italic          =   ""      Left            =   20      LockBottom      =   "True"      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   "True"      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   "True"      SelectionType   =   0      TabIndex        =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      UseFocusRing    =   "False"      Visible         =   True      Width           =   602      _ScrollOffset   =   0      _ScrollWidth    =   -1      BehaviorIndex   =   0   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  //Save the log on window close		  saveLog		End Sub	#tag EndEvent	#tag Event		Sub Open()		  If DebugBuild Then		    wPasswordLogDebug.Show		  End If		  If SpecialFolder.ApplicationData.Child("BitClamp").Child("PasswordLog.bclog") = NIL OR SpecialFolder.ApplicationData.Child("BitClamp").Child("PasswordLog.bclog").Exists = False Then		    //We have no log file		    logExists = False		    swLogSetup.ShowWithin(self)		  Else		    //We have a log file		    logExists = True		    swLogStart.ShowWithin(self)		  End If		End Sub	#tag EndEvent#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close		End Function#tag EndMenuHandler#tag MenuHandler		Function FileAboutBitClamp() As Boolean Handles FileAboutBitClamp.Action			wAbout.Show(true)		End Function#tag EndMenuHandler#tag MenuHandler		Function FileKey() As Boolean Handles FileKey.Action			wRegister.show		End Function#tag EndMenuHandler#tag MenuHandler		Function FilePreferences() As Boolean Handles FilePreferences.Action			wPrefs.Show		End Function#tag EndMenuHandler#tag MenuHandler		Function HelpReportBug() As Boolean Handles HelpReportBug.Action			ShowURL("mailto:bitclamp@fastforwardsw.com?subject=BitClamp Bug&body=Please include what you were doing at the time and any error messages and codes that appeared. Thanks for your help.")			Return True					End Function#tag EndMenuHandler#tag MenuHandler		Function HelpUserGuide() As Boolean Handles HelpUserGuide.Action			Dim ug As FolderItem = GetFolderItem(Preferences.UserGuidePath, FolderItem.PathTypeShell)						If NOT ug.Exists Then			dim r as NavigationDialogResultMBS						dim n as NavigationDialogMBS			dim o as NavigationDialogOptionsMBS						const kNavAllowPreviews             = &h00000040 // allow preview to show			const kNavSupportPackages           = &h00001000 // recognize file system packages, v2.0 or greater									o=new NavigationDialogOptionsMBS			o.Flags=kNavAllowPreviews+kNavSupportPackages			o.Message="Please locate the User Guide."						n=new NavigationDialogMBS			n.StartLocation=GetFolderItem("")			n.Options=o			n.ShowChooseFileDialog(nil)						r=n.Result			If r = NIL Then Return False			ug = r.File			Preferences.UserGuidePath = ug.ShellPath			End If						ug.Launch		End Function#tag EndMenuHandler#tag MenuHandler		Function HelpVisitWebsite() As Boolean Handles HelpVisitWebsite.Action			ShowURL("http://www.fastforwardsw.com/products/bitclamp")		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowBringAlltoFront() As Boolean Handles WindowBringAlltoFront.Action			#If TargetMacOS Then			CarbonBringAllWindowsToFront			#endif		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowMinimize() As Boolean Handles WindowMinimize.Action			Minimize		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowPasswordLog() As Boolean Handles WindowPasswordLog.Action			wPasswordLog.Show			Return True					End Function#tag EndMenuHandler	#tag Method, Flags = &h1		Protected Sub saveLog()		  Dim pwrdLog As FolderItem = SpecialFolder.ApplicationData.Child("BitClamp").Child("PasswordLog.bclog")		  Dim temp As FolderItem = TemporaryFolder.Child("tempLog.log")'GetFolderItem(TemporaryFolder.ShellPath + "/tempLog.log", FolderItem.PathTypeShell)		  Dim temp2 As FolderItem = TemporaryFolder.Child("tempc.log")'GetFolderItem(TemporaryFolder.ShellPath + "/tempc.log", FolderItem.PathTypeShell)		  Dim outStream As BinaryStream = temp2.CreateBinaryFile("")		  Dim inStream As BinaryStream		  Dim Mike As New BlowfishCBC(suppliedPassword)		  Dim Block As NEW MemoryBlock(8000)		  Dim hasher As New SHA_512		  		  		  //The file format is as follows		  //A hash of the password.		  //The number of items in the db.		  //Then a loop of each date, items encrypted, and finally the passwords.		  		  //Loop through and save each item.		  For i As Integer = 0 To lbLog.ActualRowCount		    outStream.WritePString(lbLog.ReadActualCell(i,0))		    outStream.WritePString(lbLog.ReadActualCell(i,1))		    outStream.WritePString(lbLog.ReadActualCell(i,2))		  Next		  outStream.close		  		  //Encrypt the file		  outStream = temp.CreateBinaryFile("")		  inStream = temp2.OpenAsBinaryFile		  		  If inStream <> NIL AND outStream <> NIL Then		    While inStream.Position < inStream.Length		      Block = inStream.Read(8000)		      Block = Mike.Encrypt(Block)		      outStream.Write(Block)		      app.YieldToNextThread  'Keeps the app responsive		    Wend		    Block = Mike.FinishEncrypt()		    outStream.Write(Block)		    inStream.Close		    outStream.Close		  Else		    MsgBox("There was an error while the password log was saved. Please report #wPLsL45. Thank you.")		    Return		  End If		  		  //write to new file.		  		  //Create the file		  outStream = pwrdLog.CreateBinaryFile("")		  		  //Write the password hash.		  hasher.Update(suppliedPassword)		  		  If outStream = Nil Then		    MsgBox("An error was encountered when saving the password log, it may be corrupted. Please report #wPLsL50. Thank you.")		    Return		  End If		  outStream.WritePString(hasher.Final)		  		  //Write the number of items		  outStream.WriteInt32(lbLog.ActualRowCount)		  		  //Stream through and write the encrypted data.		  inStream = temp.OpenAsBinaryFile		  		  While NOT inStream.EOF		    outStream.Write(inStream.Read(8000))		    app.YieldToNextThread		  Wend		  		  outStream.Close		  inStream.Close		  temp2.Delete		  temp.Delete		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function loadLog() As Boolean		  //Fill listbox with data		  Dim pswdLog As FolderItem = SpecialFolder.ApplicationData.Child("BitClamp").Child("PasswordLog.bclog")		  Dim temp As FolderItem = GetFolderItem(TemporaryFolder.ShellPath + "/temp.dat", FolderItem.PathTypeShell)		  Dim inStream As BinaryStream = pswdLog.OpenAsBinaryFile		  Dim outStream As BinaryStream = temp.CreateBinaryFile("")		  Dim Block As NEW MemoryBlock(8000)		  Dim itemCount, i As integer		  Dim hasher As NEW SHA_512		  Dim check As String		  		  //First we will clear out any rows that might exist in the listbox from the last test...		  lbLog.DeleteAllRows		  		  // Get password hash and check that the supplied one is correct.		  hasher.Update(suppliedPassword)		  check = hasher.Final		  		  If check <> inStream.ReadPString Then		    Beep		    MsgBox "Incorrect log password."		    Return False		  End If		  		  //Get the amount of items.		  itemCount = inStream.ReadInt32		  		  //DecryptFile		  Dim Mike As New BlowfishCBC(suppliedPassword)		  If inStream <> NIL AND outStream <> NIL Then		    While inStream.Position < inStream.Length		      app.YieldToNextThread  'Keeps the app responsive		      Block = inStream.Read(8000)		      Block = Mike.Decrypt(Block)		      outStream.Write(Block)		    Wend		    Block = Mike.FinishDecrypt()		    outStream.Write(Block)		    inStream.Close		    outStream.Close		  Else		    Beep		    MsgBox("There was an error when loading the log, it may have been corrupted, please report #wPLlL24. Thank You.")		    Return False		  End If		  		  //load in the new location		  inStream = temp.OpenAsBinaryFile		  		  //loop in data.		  For i = 0 To itemCount - 1		    lbLog.AddActualCompleteRow(inStream.ReadPString, inStream.ReadPString, inStream.ReadPString)		  Next		  		  temp.delete		  inStream.Close		  		  //add any new data that isn't in the file.		  For i = 0 To UBound(PasswordToLog)		    lbLog.AddActualCompleteRow(DateToLog(i), EncryptedFilesToLog(i), PasswordToLog(i))		  Next		  Redim PasswordToLog(-1)		  Return True		End Function	#tag EndMethod	#tag Property, Flags = &h0		suppliedPassword As String	#tag EndProperty	#tag Property, Flags = &h21		Private logExists As Boolean	#tag EndProperty#tag EndWindowCode