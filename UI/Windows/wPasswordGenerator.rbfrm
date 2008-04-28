#tag WindowBegin Window wPasswordGenerator   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "False"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   181   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   0   Resizeable      =   "False"   Title           =   "Password Generator"   Visible         =   "True"   Width           =   365   Begin CheckBox cbNums      AutoDeactivate  =   "True"      Bold            =   ""      Caption         =   "Use Numbers"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   13      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   180      Underline       =   ""      Value           =   "False"      Visible         =   True      Width           =   109      BehaviorIndex   =   0   End   Begin CheckBox cbSymbols      AutoDeactivate  =   "True"      Bold            =   ""      Caption         =   "Use Special Characters"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   128      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   180      Underline       =   ""      Value           =   "False"      Visible         =   True      Width           =   192      BehaviorIndex   =   1   End   Begin CheckBox cbCases      AutoDeactivate  =   "True"      Bold            =   ""      Caption         =   "Upper and Lower Case"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   13      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   207      Underline       =   ""      Value           =   "False"      Visible         =   True      Width           =   171      BehaviorIndex   =   2   End   Begin CheckBox cbClipboard      AutoDeactivate  =   "True"      Bold            =   ""      Caption         =   "Copy to Clipboard"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   196      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   207      Underline       =   ""      Value           =   "False"      Visible         =   True      Width           =   162      BehaviorIndex   =   3   End   Begin DisclosureTriangle dtAdvanced      AcceptFocus     =   "False"      AutoDeactivate  =   "True"      Enabled         =   True      Facing          =   0      Height          =   18      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   7      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      Top             =   150      Value           =   "False"      Visible         =   True      Width           =   18      BehaviorIndex   =   4   End   Begin StaticText stAdvanced      AutoDeactivate  =   "True"      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   22      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   5      TabPanelIndex   =   0      Text            =   "Options..."      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   150      Underline       =   ""      Visible         =   True      Width           =   70      BehaviorIndex   =   5   End   Begin Line Line1      BorderWidth     =   1      Height          =   0.0      Index           =   -2147483648      InitialParent   =   ""      Left            =   96      LineColor       =   0      Scope           =   0      TabPanelIndex   =   0      Top             =   161      Visible         =   True      Width           =   2.42e+2      X1              =   96      X2              =   338      Y1              =   161      Y2              =   161      BehaviorIndex   =   6   End   Begin Slider sLength      AutoDeactivate  =   "True"      Enabled         =   True      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   14      LineStep        =   1      LiveScroll      =   "True"      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Maximum         =   40      Minimum         =   1      PageStep        =   20      Scope           =   0      TabIndex        =   7      TabPanelIndex   =   0      Top             =   14      Value           =   10      Visible         =   True      Width           =   331      BehaviorIndex   =   7   End   Begin StaticText stLength      AutoDeactivate  =   "True"      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   143      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   8      TabPanelIndex   =   0      Text            =   "Length: 10"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   36      Underline       =   ""      Visible         =   True      Width           =   72      BehaviorIndex   =   8   End   Begin EditField EditField1      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   "True"      BackColor       =   16777215      Bold            =   ""      Border          =   "True"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   37      LimitText       =   0      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Mask            =   ""      Multiline       =   ""      Password        =   ""      ReadOnly        =   "True"      Scope           =   0      ScrollbarHorizontal=   ""      ScrollbarVertical=   "True"      Styled          =   ""      TabIndex        =   9      TabPanelIndex   =   0      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   68      Underline       =   ""      UseFocusRing    =   "True"      Visible         =   True      Width           =   308      BehaviorIndex   =   9   End   Begin StaticText stCopied      AutoDeactivate  =   "True"      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   11      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   132      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   10      TabPanelIndex   =   0      Text            =   "(Copied to Clipboard)"      TextAlign       =   1      TextColor       =   0      TextFont        =   "System"      TextSize        =   9      Top             =   95      Underline       =   ""      Visible         =   "False"      Width           =   100      BehaviorIndex   =   10   End   Begin PushButton bFill      AutoDeactivate  =   "True"      Bold            =   ""      Cancel          =   ""      Caption         =   "Fill And Encrypt"      Default         =   "True"      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   120      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   11      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   118      Underline       =   ""      Visible         =   True      Width           =   124      BehaviorIndex   =   11   End   Begin Canvas cbRefresh      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   544239200      Enabled         =   True      EraseBackground =   "True"      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   9      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   12      TabPanelIndex   =   0      Top             =   72      UseFocusRing    =   "True"      Visible         =   True      Width           =   16      BehaviorIndex   =   12   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  Me.Left = wMain.Left - Me.Width - 30		  If Me.Left < Screen(0).AvailableWidth  Then		    Me.Left = wMain.Left + Me.Width + 50		  End If		End Sub	#tag EndEvent#tag MenuHandler		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action			Close		End Function#tag EndMenuHandler	#tag Method, Flags = &h0		Function GeneratePassword(numCharacters As Integer, useUCase As Boolean, useNumbers As Boolean, useSymbols As Boolean) As String		  //Build the string:		  Dim possibleCharacters As String = "abcdefghijklmnopqrstuvwxyz"		  Dim c As New Clipboard		  If useUCase Then		    possibleCharacters = possibleCharacters + "ABCDEFGHIJKLMNOPQRSTUVWXYZ"		  End If		  If useNumbers Then		    possibleCharacters = possibleCharacters + "1234567890"		  End If		  If useSymbols Then		    possibleCharacters = possibleCharacters + "!@#$%}{[]/~`\^&*£()-+"		  End If		  		  static rand as new Random		  		  dim ret as String		  for i as Integer = 1 to numCharacters		    ret = ret + Mid( possibleCharacters, rand.InRange( 1, Len( possibleCharacters ) ), 1 )		  next i		  		  If cbClipboard.value Then		    //Copy to Clipboard		    c.SetText(ret)		  End If		  stCopied.Visible = cbClipboard.Value		  return ret		End Function	#tag EndMethod#tag EndWindowCode#tag Events cbNums	#tag Event		Sub Open()		  Me.Value = Preferences.pGenNums		  Me.MacControlSize = MacControlSize.Mini		End Sub	#tag EndEvent	#tag Event		Sub Action()		  EditField1.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent	#tag Event		Sub Close()		  Preferences.pGenNums = Me.Value		End Sub	#tag EndEvent#tag EndEvents#tag Events cbSymbols	#tag Event		Sub Open()		  Me.Value = Preferences.pGenSymbols		  Me.MacControlSize = MacControlSize.Mini		End Sub	#tag EndEvent	#tag Event		Sub Action()		  EditField1.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent	#tag Event		Sub Close()		  Preferences.pGenSymbols = Me.Value		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cbCases	#tag Event		Sub Open()		  Me.Value = Preferences.pGenCases		  Me.MacControlSize = MacControlSize.Mini		End Sub	#tag EndEvent	#tag Event		Sub Action()		  EditField1.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent	#tag Event		Sub Close()		  Preferences.pGenCases = Me.Value		End Sub	#tag EndEvent#tag EndEvents#tag Events cbClipboard	#tag Event		Sub Open()		  Me.Value = Preferences.pGenClipboard		  Me.MacControlSize = MacControlSize.Mini		End Sub	#tag EndEvent	#tag Event		Sub Close()		  Preferences.pGenClipboard = Me.Value		  		End Sub	#tag EndEvent#tag EndEvents#tag Events dtAdvanced	#tag Event		Sub Action()		  If NOT Me.Value Then		    self.Animate(CreateRect(self.Top, self.Left, self.Height - 60, self.width), 0.2)		  Else		    self.Animate(CreateRect(self.Top, self.Left, self.Height + 60, self.width), 0.2)		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events stAdvanced	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  dtAdvanced.Value = NOT dtAdvanced.Value		End Function	#tag EndEvent#tag EndEvents#tag Events sLength	#tag Event		Sub ValueChanged()		  stLength.Text = "Length: " + str(Me.Value)		  EditField1.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent#tag EndEvents#tag Events EditField1	#tag Event		Sub Open()		  Me.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent#tag EndEvents#tag Events bFill	#tag Event		Sub Action()		  swKey.edKey.Text = EditField1.Text		  swKey.edConfirm.Text = EditField1.Text		  swKey.bOk.Push		End Sub	#tag EndEvent#tag EndEvents#tag Events cbRefresh	#tag Event		Function MouseDown(X As Integer, Y As Integer) As Boolean		  Me.Backdrop = refresh_pressed		  Return True		End Function	#tag EndEvent	#tag Event		Sub MouseUp(X As Integer, Y As Integer)		  Me.Backdrop = refresh		  EditField1.Text = GeneratePassword(sLength.Value, cbCases.Value, cbNums.Value, cbSymbols.Value)		End Sub	#tag EndEvent#tag EndEvents