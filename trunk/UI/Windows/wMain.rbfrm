#tag WindowBegin AsyncDragWindow wMain   BackColor       =   0   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "False"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   159   ImplicitInstance=   "True"   LiveResize      =   "False"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   326659859   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   1   Resizeable      =   "False"   Title           =   "BitClamp"   Visible         =   "True"   Width           =   340   Begin Thread DropThread      ControlOrder    =   0      Index           =   -2147483648      InitialParent   =   ""      Left            =   125      Priority        =   5      Scope           =   0      StackSize       =   0      TabPanelIndex   =   0      Top             =   258      BehaviorIndex   =   18   End   Begin PushButton bNo      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "No"      ControlOrder    =   1      Default         =   "False"      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   112      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   46      Underline       =   ""      Visible         =   "False"      Width           =   80      BehaviorIndex   =   0   End   Begin PushButton bYes      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "Yes"      ControlOrder    =   2      Default         =   "True"      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   204      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   46      Underline       =   ""      Visible         =   "False"      Width           =   80      BehaviorIndex   =   1   End   Begin StaticText stAreyouSure      AutoDeactivate  =   "True"      Bold            =   ""      ControlOrder    =   3      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   18      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabPanelIndex   =   0      Text            =   "Are you sure you wish to decrypt this file?"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      Visible         =   "False"      Width           =   264      BehaviorIndex   =   2   End   Begin PushButton bCancel      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "Cancel"      ControlOrder    =   4      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   130      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   78      Underline       =   ""      Visible         =   "False"      Width           =   80      BehaviorIndex   =   3   End   Begin StaticText stReports      AutoDeactivate  =   "True"      Bold            =   ""      ControlOrder    =   5      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabPanelIndex   =   0      Text            =   ""      TextAlign       =   1      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   46      Underline       =   ""      Visible         =   "False"      Width           =   300      BehaviorIndex   =   4   End   Begin ProgressBar pbProgress      AutoDeactivate  =   "True"      ControlOrder    =   6      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Maximum         =   100      Scope           =   0      TabPanelIndex   =   0      Top             =   14      Value           =   0      Visible         =   "False"      Width           =   300      BehaviorIndex   =   5   End   Begin Canvas cBack      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   1625687995      ControlOrder    =   7      Enabled         =   True      EraseBackground =   "True"      Height          =   148      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   0      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   0      UseFocusRing    =   "False"      Visible         =   True      Width           =   340      BehaviorIndex   =   6      Begin ProgressWheel pwDrop         AutoDeactivate  =   "True"         ControlOrder    =   8         Enabled         =   True         Height          =   16         HelpTag         =   ""         Index           =   -2147483648         InitialParent   =   "cBack"         Left            =   162         LockBottom      =   ""         LockLeft        =   ""         LockRight       =   ""         LockTop         =   ""         Scope           =   0         TabPanelIndex   =   0         Top             =   61         Visible         =   "False"         Width           =   16         BehaviorIndex   =   7      End   End   Begin Canvas cBorder      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   ""      ControlOrder    =   9      Enabled         =   True      EraseBackground =   "True"      Height          =   24      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   62      LockBottom      =   "True"      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   136      UseFocusRing    =   "False"      Visible         =   True      Width           =   278      BehaviorIndex   =   8   End   Begin Canvas cbAdd      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   2087718312      ControlOrder    =   10      Enabled         =   True      EraseBackground =   "True"      Height          =   25      HelpTag         =   "Add a file/folder"      Index           =   -2147483648      InitialParent   =   ""      Left            =   31      LockBottom      =   "True"      LockLeft        =   "True"      LockRight       =   "False"      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   136      UseFocusRing    =   "False"      Visible         =   True      Width           =   32      BehaviorIndex   =   9   End   Begin Canvas cbMinus      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   1345261377      ControlOrder    =   11      Enabled         =   "False"      EraseBackground =   "True"      Height          =   25      HelpTag         =   "Remove a file/folder"      Index           =   -2147483648      InitialParent   =   ""      Left            =   62      LockBottom      =   "True"      LockLeft        =   "True"      LockRight       =   "False"      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   136      UseFocusRing    =   "False"      Visible         =   "False"      Width           =   32      BehaviorIndex   =   10   End   Begin Canvas cbAction      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   71766258      ControlOrder    =   12      Enabled         =   True      EraseBackground =   "True"      Height          =   25      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   0      LockBottom      =   "True"      LockLeft        =   "True"      LockRight       =   "False"      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   136      UseFocusRing    =   "False"      Visible         =   True      Width           =   32      BehaviorIndex   =   11   End   Begin BCDisplayHead bcdhHeader      AcceptFocus     =   "True"      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   ""      ControlOrder    =   13      Enabled         =   "True"      EraseBackground =   "True"      Height          =   19      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   25      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   22      UseFocusRing    =   "False"      Visible         =   "False"      Width           =   430      BehaviorIndex   =   12   End   Begin ScrollBar sbwMain      AcceptFocus     =   "true"      AutoDeactivate  =   "True"      ControlOrder    =   14      Enabled         =   True      Height          =   151      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   444      LineStep        =   1      LiveScroll      =   "True"      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Maximum         =   0      Minimum         =   0      PageStep        =   100      Scope           =   0      TabPanelIndex   =   0      Top             =   40      Value           =   0      Visible         =   True      Width           =   11      BehaviorIndex   =   13   End   Begin PushButton bFirstCancel      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "Cancel"      ControlOrder    =   15      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   274      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   205      Underline       =   ""      Visible         =   True      Width           =   80      BehaviorIndex   =   14   End   Begin PushButton bEncrypt      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "Encrypt"      ControlOrder    =   16      Default         =   "False"      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   375      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   205      Underline       =   ""      Visible         =   True      Width           =   80      BehaviorIndex   =   15   End   Begin Canvas Canvas1      AcceptFocus     =   "True"      AcceptTabs      =   "False"      AutoDeactivate  =   "True"      Backdrop        =   ""      ControlOrder    =   17      Enabled         =   True      EraseBackground =   "True"      Height          =   181      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   25      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabPanelIndex   =   0      Top             =   22      UseFocusRing    =   "False"      Visible         =   True      Width           =   419      BehaviorIndex   =   16      Begin BCDisplay bcdList         AcceptFocus     =   ""         AcceptTabs      =   ""         AutoDeactivate  =   "False"         Backdrop        =   ""         ControlOrder    =   18         Enabled         =   "True"         EraseBackground =   "True"         Height          =   150         HelpTag         =   ""         Index           =   -2147483648         InitialParent   =   "Canvas1"         Left            =   25         LockBottom      =   ""         LockLeft        =   ""         LockRight       =   ""         LockTop         =   ""         RowHeight       =   50         RowHighlight    =   0         RowSelected     =   0         Scope           =   0         TabPanelIndex   =   0         Top             =   40         UseFocusRing    =   "False"         Visible         =   "False"         Width           =   419         BehaviorIndex   =   17      End   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  //Set window to last position on the screen.		  If Preferences.pLeft <> -1 AND Preferences.pTop <> -1 AND Preferences.pLeft < Screen(0).AvailableWidth AND Preferences.pTop < Screen(0).AvailableHeight Then		    Self.Left = Preferences.pLeft		    Self.Top = Preferences.pTop		  End If		  		  //Register growl if it is enabled but not registered, then set the property to true.		  #If TargetMacOS		    InitializeGrowl		  #endif		  		  bcdList.sbScroll = sbwMain		  		  		  		End Sub	#tag EndEvent	#tag Event		Sub Close()		  Preferences.pLeft = Self.Left		  Preferences.pTop = Self.Top		  Quit		End Sub	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  If WindowStatus = 2 AND bcdList.RowSelected Then		    Select Case asc(key)		      		      //Delete key or backspace key = remove the selected item		    Case 8		      bcdList.Remove(bcdList.SelectedRow)		    Case 127		      bcdList.Remove(bcdList.SelectedRow)		      		      //Up key = select the one above - if the selected row is not the top row.		    Case 30		      If bcdList.SelectedRow <> 1 Then		        bcdList.SelectedRow = bcdList.SelectedRow - 1		        bcdList.Refresh		      End If		      		      //Down key = select the one below if the row is not the bottom row.		    Case 31		      If bcdList.SelectedRow <> UBound(bcdList.Details) + 1 Then		        bcdList.SelectedRow = bcdList.SelectedRow + 1		        bcdList.Refresh		      End If		    End Select		  End If		  		  'up = 30		  'down = 31		End Function	#tag EndEvent	#tag Event		Sub Deactivate()		  Active = False		  Select Case WindowStatus		  Case 1		    cBack.Backdrop = BCBackground		    cBack.Refresh		  Case 2		    bcdList.RowHighlight = GrayRowHighlight		    bcdList.Refresh		  End Select		  		  		End Sub	#tag EndEvent	#tag Event		Sub Activate()		  Active = True		  Select Case WindowStatus		  Case 1		    cBack.Backdrop = BCBack1		    cBack.Refresh		  Case 2		    bcdList.RowHighlight = DefaultRowHighlight		    bcdList.Refresh		  End Select		  		  		End Sub	#tag EndEvent	#tag Event		Sub EnableMenuItems()		  If bcdList.RowSelected Then		    FileRemoveItem.Enable		  End If		End Sub	#tag EndEvent#tag MenuHandler		Function FilePreferences() As Boolean Handles FilePreferences.Action			wPrefs.Show		End Function#tag EndMenuHandler#tag MenuHandler		Function FileRemoveItem() As Boolean Handles FileRemoveItem.Action			If WindowStatus < 3 Then			If bcdList.RowSelected Then			bcdList.Remove(bcdList.SelectedRow)			End If			End If		End Function#tag EndMenuHandler#tag MenuHandler		Function FileAddItem() As Boolean Handles FileAddItem.Action			If WindowStatus < 3 Then			AddItemWithDialogue			End If		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowMinimize() As Boolean Handles WindowMinimize.Action			Minimize		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowBringAlltoFront() As Boolean Handles WindowBringAlltoFront.Action			#If TargetMacOS Then			CarbonBringAllWindowsToFront			#endif		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowPasswordLog() As Boolean Handles WindowPasswordLog.Action			wPasswordLog.Show			Return True					End Function#tag EndMenuHandler#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close		End Function#tag EndMenuHandler	#tag Method, Flags = &h0		Sub Transition()		  Dim i as integer		  bcdhHeader.Visible = True		  bcdList.Visible = True		  cBack.Visible = False		  cbMinus.Visible = True		  cbMinus.Enabled = True		  bEncrypt.Visible = True		  bEncrypt.Default = True		  bFirstCancel.Visible = True		  Self.Animate(CreateRect(self.Top, self.Left, 260, 480), 0.25)		  DoingEncrypt = True		  For i = 0 to UBound(Items)		    bcdList.Update(Items(i))		  Next		  		  WindowStatus = 2		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Transition2()		  cBack.Visible = False		  bcdhHeader.Visible = False		  bcdList.Visible = False		  pbProgress.Visible = True		  pbProgress.Value = 0		  stReports.Visible = True		  bCancel.Visible = True		  cbAdd.Visible = False		  cbAction.Visible = False		  cbMinus.Visible = False		  cBorder.Visible = False		  #If TargetMacOS Then		    CarbonResize(wMain, 340, 120, 0)		  #else		    Self.Animate(CreateRect(self.Top, self.Left, 120, 340), 0.25)		  #endif		  FileAddItem.Enabled = False		  FileRemoveItem.Enabled = False		  		  swKey.ShowWithin(Self)		  		  WindowStatus = 3		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub ResetWindow()		  pbProgress.Visible = False		  stReports.Visible = False		  bCancel.Visible = False		  cbMinus.Visible = False		  cbAdd.Visible = True		  cbAction.Visible = True		  cBorder.Visible = True		  cBack.Visible = True		  bcdList.Visible = False		  bEncrypt.Visible = False		  bFirstCancel.Visible = False		  bcdhHeader.Visible = False		  stAreyouSure.Visible = False		  stReports.Text = ""		  bCancel.Caption = "Cancel"		  bCancel.Default = False		  bYes.Visible = False		  bNo.Visible = False		  If wMain.Active = True Then		    cBack.Backdrop = BCBack1		  Else		    cBack.Backdrop = BCBackground		  End If		  Self.Animate(CreateRect(self.Top, self.Left, 159, 340), 0.2)		  		  Self.Backdrop = nil		  Redim Items(-1)		  bcdList.Reset		  		  windowStatus = 1		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DecryptTransition()		  cBack.Visible = False		  cbAdd.Visible = False		  cbAction.Visible = False		  cBorder.Visible = False		  stAreyouSure.Visible = True		  bYes.Visible = True		  bNo.Visible = True		  DoingEncrypt = False		  Self.Animate(CreateRect(self.Top, self.Left, 80, 300), 0.2)		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub AddItemWithDialogue()		  #If TargetMacOS Then		    dim r as NavigationDialogResultMBS		    		    dim n as NavigationDialogMBS		    dim o as NavigationDialogOptionsMBS		    		    const kNavAllowPreviews             = &h00000040 // allow preview to show		    const kNavSupportPackages           = &h00001000 // recognize file system packages, v2.0 or greater		    		    		    o=new NavigationDialogOptionsMBS		    o.Flags=kNavAllowPreviews+kNavSupportPackages'+kNavAllowMultipleFiles		    o.Message="Please choose a file/folder you wish to encrypt."		    		    n=new NavigationDialogMBS		    n.StartLocation=GetFolderItem("")		    n.Options=o		    n.ShowChooseObjectDialog		    		    r=n.Result		    		    		    if r<>nil then		      Items.append(r.File)		      If WindowStatus = 1 then		        Transition		      Else		        bcdList.Update(r.File)		      End If		    end if		  #Else		    Dim x as FolderItem		    x = GetOpenFolderItem("")		    If x <> NIL Then		      bcdList.Update(x)		    End If		  #endif		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub InitializeGrowl()		  Growl = New GrowlMBS		  //Check growl is installed		  //Load framework.		  		  #If DebugBuild Then		    Dim grlfolder As FolderItem = App.ExecutableFile.Parent.Parent.Parent.Parent.Child("Frameworks").Child("Growl.framework")		    If NOT Growl.LoadFramework(grlfolder) Then		      MsgBox "Growl did not load."		      Return		    End If		  #Else		    Dim grlfolder As FolderItem = App.ExecutableFile.Parent.Parent.Child("Frameworks").Child("Growl.framework")		    If NOT Growl.LoadFramework(grlfolder) Then		      MsgBox "Growl did not load correctly. Please report #GwM13."		      Return		    End If		  #endif		  If Growl.IsInstalled Then		    		    Dim regArray(5) As String		    Dim defaultArray(3) As String		    		    //Set notifications and default notifications		    regArray(0) = "Encryption Finished"		    regArray(1) = "Encryption Started"		    regArray(2) = "Decryption Finished"		    regArray(3) = "Decryption Started"		    regArray(4) = "Decryption Error"		    regArray(5) = "Encryption Error"		    defaultArray(0) = "Encryption Finished"		    defaultArray(1) = "Decryption Finished"		    defaultArray(2) = "Decryption Error"		    defaultArray(3) = "Encryption Error"		    		    //Register growl		    Growl.ApplicationName = "BitClamp"		    Growl.SetAllNotificationArray(regArray())		    Growl.SetDefaultNotificationArray(defaultArray())		    Growl.Register		    		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub TransitionBack()		  //Transitions the window back to the encryption list state.		  		  Dim i as integer		  bcdhHeader.Visible = True		  bcdList.Visible = True		  cBack.Visible = False		  cbMinus.Visible = True		  cbMinus.Enabled = True		  bEncrypt.Visible = True		  bEncrypt.Default = True		  bFirstCancel.Visible = True		  cbAdd.Visible = True		  cbAction.Visible = True		  cbMinus.Visible = True		  cBorder.Visible = True		  stReports.Visible = False		  pbProgress.Visible = False		  bCancel.Visible = False		  Self.Animate(CreateRect(self.Top, self.Left, 260, 480), 0.25)		  		  DoingEncrypt = True		  		  WindowStatus = 2		End Sub	#tag EndMethod	#tag Property, Flags = &h0		CurrentValue As Integer	#tag EndProperty	#tag Property, Flags = &h0		WindowStatus As Short = 1	#tag EndProperty	#tag Property, Flags = &h0		Active As Boolean = True	#tag EndProperty	#tag Property, Flags = &h21		Private obj As DragItem	#tag EndProperty	#tag Property, Flags = &h21		Private action As Integer	#tag EndProperty#tag EndWindowCode#tag Events DropThread	#tag Event		Sub Run()		  checker = NEW BCTagger		  If  NOT checker.CheckTag(obj.FolderItem) Then		    If Action <> 3 then		      Do		        Items.Append(obj.FolderItem)		      Loop until obj.NextItem = False		    End If		    Transition		  Else		    If Checker.kFileTypeVersion > BitClamp.kFileTypeVersion Then		      Beep		      MsgBox("This file was produced by a later version of BitClamp and cannot be decrypted by this version.")		    Else		      Items.Append(obj.FolderItem)		      If Preferences.DecryptReminder = True Then		        DecryptTransition		      Else		        DoingEncrypt = False		        Transition2		      End If		    End If		  End If		  		  pwDrop.Visible = False		End Sub	#tag EndEvent#tag EndEvents#tag Events bNo	#tag Event		Sub Action()		  ResetWindow		End Sub	#tag EndEvent#tag EndEvents#tag Events bYes	#tag Event		Sub Action()		  bNo.Visible = False		  bYes.Visible = False		  stAreyouSure.visible = False		  Transition2		End Sub	#tag EndEvent#tag EndEvents#tag Events bCancel	#tag Event		Sub Action()		  If Me.Caption = "OK" then		    ResetWindow		  Else		    If arc = NIL AND enc = NIL Then		      MsgBox "The process cannot be cancelled at the moment."		    Else		      If arc <> NIL Then arc.Cancel		      If enc <> NIL Then enc.Kill		      ResetWindow		    End If		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events cBack	#tag Event		Sub Open()		  Me.AcceptFileDrop(FileTypes.AnyFile)		End Sub	#tag EndEvent	#tag Event		Function DragEnter(obj As DragItem, action As Integer) As Boolean		  'Me.MouseCursor = drop cursor		  Me.Backdrop = BCBack2		  		End Function	#tag EndEvent	#tag Event		Sub DragExit(obj As DragItem, action As Integer)		  'Me.Cursor = system.Cursors.StandardPointer		  If Me.Active = True Then		    Me.Backdrop = BCBack1		  Else		    Me.Backdrop = BCBackground		  End If		End Sub	#tag EndEvent	#tag Event		Sub DropObject(obj As DragItem, action As Integer)		  pwDrop.Visible = True		  self.obj = obj		  self.action = action		  DropThread.Run		  		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cBorder	#tag Event		Sub Paint(g As Graphics)		  For x As short = 0 To Me.Width		    g.DrawPicture(BottomBorder,x,0)		  Next x		End Sub	#tag EndEvent#tag EndEvents#tag Events cbAdd	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  Me.Backdrop = addButtonPressed		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  AddItemWithDialogue		  Me.Backdrop = addButton		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cbMinus	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  Me.Backdrop = MinusButtonPressed		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  If bcdList.RowSelected Then		    bcdList.Remove(bcdList.SelectedRow)		  End If		  Me.Backdrop = MinusButton		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cbAction	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  me.Backdrop = ActionButtonPressed		  		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  Me.Backdrop = ActionButton		  Dim actions as new MenuItem		  Dim results as new MenuItem		  dim left, top as integer		  		  left = wMain.Left - 1 'This calculates where the menu should appear.		  		  Select Case WindowStatus		  Case 1		    top = wMain.Top + 164		  Case 2		    top = wMain.Top + 264		  End Select		  		  actions.append(new MenuItem("Add"))		  		  If WindowStatus = 2 then		    Dim rmv  as New MenuItem		    Dim cncl as new MenuItem		    rmv.Text = "Remove"		    cncl.Text = "Cancel Selection"		    		    If bcdList.RowSelected Then		      rmv.Enabled = True		      cncl.Enabled = True		    Else		      rmv.Enabled = False		      cncl.Enabled = False		    End If		    actions.append(rmv)		    actions.append(cncl)		  End If		  actions.append(new MenuItem("Change Algorithm")) 'Adds an item to the menu.		  		  results = actions.popup(left,top)		  		  If results <> nil then		    Select Case Results.Text		    Case "Change Algorithm"		      wChangeEncryption.Show		    Case "Cancel Selection"		      bcdList.RowSelected = False		      bcdList.Refresh		    Case "Remove"		      bcdList.Remove(bcdList.SelectedRow)		    Case "Add"		      AddItemWithDialogue		    End Select		  End If		  		  		End Sub	#tag EndEvent#tag EndEvents#tag Events sbwMain	#tag Event		Sub ValueChanged()		  Dim distance as integer		  bcdList.ScrollValue = Me.Value		  Distance = Me.Value - CurrentValue		  bcdList.Scroll(0, -Distance)		  CurrentValue = Me.Value		End Sub	#tag EndEvent#tag EndEvents#tag Events bFirstCancel	#tag Event		Sub Action()		  ResetWindow		End Sub	#tag EndEvent#tag EndEvents#tag Events bEncrypt	#tag Event		Sub Action()		  If UBound(Items) <> -1 Then		    Transition2		  Else		    MsgBox "Please select files or folders that you wish to encrypt."		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events Canvas1	#tag Event		Sub Paint(g As Graphics)		  g.ForeColor = &c7E7E7E		  g.DrawLine(0, 168, me.width, 168)		End Sub	#tag EndEvent#tag EndEvents#tag Events bcdList	#tag Event		Sub ItemRemoved(RowRemoved as integer)		  Items.Remove(RowRemoved - 1)		End Sub	#tag EndEvent	#tag Event		Function ObjectDropped(obj as FolderItem) As Boolean		  //We return True if we want to add the item to the display.		  //The display will loop through the dragitem calling this event for each folderitem.		  For i as integer = 0 to UBound(Items)		    If obj.ShellPath = Items(i).ShellPath Then		      Return False		    End If		  Next		  Items.Append(obj)		  Return True		End Function	#tag EndEvent	#tag Event		Sub Unselected()		  Me.RowSelected = False		  Me.Refresh		End Sub	#tag EndEvent#tag EndEvents