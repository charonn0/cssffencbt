#tag WindowBegin Window wAbout   BackColor       =   16777215   Backdrop        =   0   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "True"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   326   ImplicitInstance=   "True"   LiveResize      =   "False"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   326659859   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "False"   MinWidth        =   64   Placement       =   4   Resizeable      =   "False"   Title           =   ""   Visible         =   "True"   Width           =   284   Begin DGEditField EditAppCredits      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   "True"      BackColor       =   16777215      BehaviorIndex   =   0      Bold            =   ""      Border          =   "True"      ControlOrder    =   0      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   138      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   0      LimitText       =   0      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Mask            =   ""      Multiline       =   "True"      Password        =   ""      ReadOnly        =   "True"      Scope           =   0      ScrollbarHorizontal=   ""      ScrollbarVertical=   "True"      Styled          =   "True"      TabIndex        =   0      TabPanelIndex   =   0      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   133      Underline       =   ""      UseFocusRing    =   "False"      Visible         =   True      Width           =   284      BehaviorIndex   =   0   End   Begin Canvas AppIconCanvas      AcceptFocus     =   "False"      AcceptTabs      =   "False"      AutoDeactivate  =   "True"      Backdrop        =   0      BehaviorIndex   =   1      ControlOrder    =   1      Enabled         =   True      EraseBackground =   "True"      Height          =   64      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   110      LockBottom      =   "False"      LockLeft        =   "False"      LockRight       =   "False"      LockTop         =   "False"      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      Top             =   8      UseFocusRing    =   "True"      Visible         =   True      Width           =   64      BehaviorIndex   =   1   End   Begin StaticText StatAppName      AutoDeactivate  =   "False"      BehaviorIndex   =   2      Bold            =   "True"      ControlOrder    =   2      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   "False"      Left            =   20      LockBottom      =   "False"      LockLeft        =   "False"      LockRight       =   "False"      LockTop         =   "False"      Multiline       =   "False"      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      Text            =   "kAppName"      TextAlign       =   1      TextColor       =   0      TextFont        =   "System"      TextSize        =   14      Top             =   86      Underline       =   "False"      Visible         =   True      Width           =   244      BehaviorIndex   =   2   End   Begin StaticText StatAppVersion      AutoDeactivate  =   "False"      BehaviorIndex   =   3      Bold            =   "False"      ControlOrder    =   3      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   12      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   "False"      Left            =   20      LockBottom      =   "False"      LockLeft        =   "False"      LockRight       =   "False"      LockTop         =   "False"      Multiline       =   "False"      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      Text            =   "kAppVersion"      TextAlign       =   1      TextColor       =   0      TextFont        =   "System"      TextSize        =   10      Top             =   112      Underline       =   "False"      Visible         =   True      Width           =   244      BehaviorIndex   =   3   End   Begin StaticText StatAppCopyright      AutoDeactivate  =   "False"      BehaviorIndex   =   4      Bold            =   "False"      ControlOrder    =   4      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   42      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   "False"      Left            =   20      LockBottom      =   "False"      LockLeft        =   "False"      LockRight       =   "False"      LockTop         =   "False"      Multiline       =   "True"      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      Text            =   "kAppCopyright"      TextAlign       =   1      TextColor       =   0      TextFont        =   "System"      TextSize        =   10      Top             =   280      Underline       =   "False"      Visible         =   True      Width           =   244      BehaviorIndex   =   4   EndEnd#tag EndWindow#tag WindowCode#tag MenuHandler		Function WindowMinimize() As Boolean Handles WindowMinimize.Action			Minimize		End Function#tag EndMenuHandler#tag MenuHandler		Function WindowBringAlltoFront() As Boolean Handles WindowBringAlltoFront.Action			#If TargetMacOS Then			CarbonBringAllWindowsToFront			#endif		End Function#tag EndMenuHandler#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close		End Function#tag EndMenuHandler	#tag Method, Flags = &h1		Protected Sub SetCreditsFieldText(credits as string, HTML as boolean)		  #pragma DisableBackgroundTasks		  dim start, length as integer		  dim tag, tagType as string		  dim TextSize, TempSize as integer		  dim FieldText as string		  		  /// Set Field Text		  EditAppCredits.Text = credits		  		  /// Exit if not styled text		  if HTML = false then		    Return		  end if		  		  		  /// Stylize Text		  do		    // Get field Text for this iteration		    FieldText = EditAppCredits.text		    		    // Find beginning of HTML tag		    start = InStr(FieldText, "<")		    if start = 0 then		      exit		    end if		    		    // Find end of HTML Tag		    length = InStr(start, FieldText, ">") - start + 1		    		    		    // Get Tag String		    tag = Mid(FieldText, start + 1, length - 2)		    tagType = NthField(tag, " ", 1)		    		    		    // Remove Tag And Select the Rest of the Text		    EditAppCredits.SelStart = start - 1		    EditAppCredits.SelLength = length		    EditAppCredits.SelText = ""		    EditAppCredits.SelStart = start - 1		    EditAppCredits.SelLength = Len(FieldText) - start		    		    // Determine what kind of tag it is		    Select Case tagType		    Case "b"		      EditAppCredits.SelBold = true		      		    Case "/b"		      EditAppCredits.SelBold = false		      		    Case "i"		      EditAppCredits.SelItalic = true		      		    Case "/i"		      EditAppCredits.SelItalic = false		      		    Case "font"		      '<font size="10">		      TempSize = Val(NthField(tag, """", 2))		      TextSize = EditAppCredits.SelTextSize		      EditAppCredits.SelTextSize = tempSize		      		    Case "/font"		      // Restore to previous size		      EditAppCredits.SelTextSize = TextSize		    end Select		  loop		  		  // Reset field so it's not moved or has a selection		  EditAppCredits.ScrollPosition = 0		  EditAppCredits.SelStart = -1		  EditAppCredits.SelLength = 0		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Show(pUseCredits as boolean)		  UseCredits = pUseCredits		  SetupWindow		  Super.Show		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub SetupWindow()		  // Remove Minimize Button		  #if TargetMacOS then		    Declare Sub ChangeWindowAttributes Lib "Carbon" (win as WindowPtr, setAttribs as integer, removeAttribs as integer)		    ChangeWindowAttributes self, 0, 1000		  #endif		  		  		  // Display Data		  StatAppName.Text = kAppName		  'StatAppVersion.Text = kAppVersion		  StatAppCopyright.Text = kAppCopyright		  		  // Redesign window according to kAppUseCredits		  if UseCredits then		    SetCreditsFieldText kAppCredits, true		    StatAppCopyright.top = 280		    EditAppCredits.Visible = true		    self.Height = 326		  else		    EditAppCredits.Visible = false		    StatAppCopyright.top = 132		    self.Height = 178		  end if		End Sub	#tag EndMethod	#tag Property, Flags = &h1		Protected UseCredits As boolean	#tag EndProperty	#tag Constant, Name = kAppCopyright, Type = String, Dynamic = False, Default = \"\xC2\xA9 Copyright 2008\x2C Daniel Greg\x2C\rAll Rights Reserved.", Scope = Public	#tag EndConstant	#tag Constant, Name = kAppCredits, Type = String, Dynamic = False, Default = \"<b>Design and Engineering:</b>\r      Daniel Greg\r\r<b>Graphics:</b>\r      Daniel Greg\r      Sebastiaan de With \r      (\"Noble\" stock icon set)\r\r<b>Icon:</b>\r      \"Elroy\"\r      (www.elroyonline.net)\r\r<b>Testing:</b>\r      Daniel Greg\r      Chris Marshall\r      Rhys Cox\r      Matthew Brewer\r      Ashley Cooper\r      Chris Messina\r      Wayne Lefevre\r      Darren Rolfe\r      Itai Ferber\r      Keith Andrews\r      Miles Evans\r      Frank Cantu\r      George Anthony\r      Duncan\r      RapidMac\r\r<b>Components:</b>\r      AsyncDragWindow: Frank Condello\r      e-CryptIt Engine: Einhugur Software\r      MBS Plugins: MonkeyBread Software\r      Sparkle - Andy Matuschak\r     \r<b><i>With special thanks to:</i></b>\r      Chris Marshall\r      Rhys Cox\r      Matt Beveridge\r      Ben Greg\r      Carl Johnston\r      Will Blundell\r      Joshua Coventry\r      Neil and Nicci Hopson\r      \r\r<b>Disclaimer:</b>\r<font size\x3D\"10\">THE SOFTWARE IS PROVIDED \"AS IS\"\x2C WITHOUT WARRANTY OF ANY KIND\x2C EXPRESS OR IMPLIED\x2C INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY\x2C FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM\x2C OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES\x2C OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE\x2C DATA OR PROFITS\x2C WHETHER IN AN ACTION OF CONTRACT\x2C NEGLIGENCE OR OTHER TORTIOUS ACTION\x2C ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.</font>", Scope = Public	#tag EndConstant	#tag Constant, Name = kAppName, Type = String, Dynamic = False, Default = \"BitClamp", Scope = Public	#tag EndConstant#tag EndWindowCode#tag Events AppIconCanvas	#tag Event		Sub Paint(g As Graphics)		  g.DrawPicture BitClamplogo, 0, 0, 64, 64, 0, 0, BitClampLogo.Width, Bitclamplogo.Height		  		  		End Sub	#tag EndEvent#tag EndEvents#tag Events StatAppVersion	#tag Event		Sub Open()		  Dim pList as FolderItem = App.ExecutableFile.Parent.Parent.Child("Info.plist")		  Dim inStream as TextInputStream = pList.OpenAsTextFile		  Dim pos as UInt64		  Dim value as String		  pos = InStr(inStream.ReadAll, "<key>CFBundleGetInfoString</key>")		  inStream.PositionB = Pos		  value = inStream.ReadLine		  		  //Value now = the target value.		  Me.Text = ParseLine(inStream.ReadLine, "string")		End Sub	#tag EndEvent#tag EndEvents