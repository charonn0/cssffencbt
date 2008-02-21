#tag WindowBegin Window wLogPassword   BackColor       =   &hFFFFFF   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "False"   Frame           =   1   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   170   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   0   Resizeable      =   "False"   Title           =   "Please Provide Your Log Password"   Visible         =   "True"   Width           =   401   Begin StaticText StaticText1      AutoDeactivate  =   "True"      BehaviorIndex   =   0      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   33      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   "False"      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   "True"      Multiline       =   "True"      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      Text            =   "BitClamp needs your log password to be able to save the log."      TextAlign       =   0      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      Visible         =   True      Width           =   361      BehaviorIndex   =   0   End   Begin EditField edKey      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   "True"      BackColor       =   &hFFFFFF      BehaviorIndex   =   1      Bold            =   ""      Border          =   "True"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   100      LimitText       =   0      LockBottom      =   ""      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   "True"      Mask            =   ""      Multiline       =   ""      Password        =   "True"      ReadOnly        =   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollbarVertical=   "True"      Styled          =   ""      TabIndex        =   1      TabPanelIndex   =   0      Text            =   ""      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   0      Top             =   65      Underline       =   ""      UseFocusRing    =   "True"      Visible         =   True      Width           =   281      BehaviorIndex   =   1   End   Begin StaticText StaticText2      AutoDeactivate  =   "True"      BehaviorIndex   =   2      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   "True"      Multiline       =   ""      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      Text            =   "Password:"      TextAlign       =   2      TextColor       =   &h000000      TextFont        =   "System"      TextSize        =   0      Top             =   66      Underline       =   ""      Visible         =   True      Width           =   68      BehaviorIndex   =   2   End   Begin CheckBox cbKeychain      AutoDeactivate  =   "True"      BehaviorIndex   =   3      Bold            =   ""      Caption         =   "Save Password to Keychain"      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   "Saving your password to the system keychain avoids having to type in the password every time BitClamp closes."      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   98      Underline       =   ""      Value           =   ""      Visible         =   True      Width           =   198      BehaviorIndex   =   3   End   Begin PushButton bOK      AutoDeactivate  =   "True"      BehaviorIndex   =   4      Bold            =   ""      Cancel          =   ""      Caption         =   "OK"      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   301      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   130      Underline       =   ""      Visible         =   True      Width           =   80      BehaviorIndex   =   4   End   Begin PushButton bCancel      AutoDeactivate  =   "True"      BehaviorIndex   =   5      Bold            =   ""      Cancel          =   ""      Caption         =   "Cancel"      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   209      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   5      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   130      Underline       =   ""      Visible         =   True      Width           =   80      BehaviorIndex   =   5   EndEnd#tag EndWindow#tag WindowCode#tag EndWindowCode#tag Events cbKeychain	#tag Event		Sub Open()		  If NOT TargetMacOS Then		    Me.Visible = False		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events bOK	#tag Event		Sub Action()		  suppliedLogPassword = edKey.Text		  If SavePasswordLog Then		    If cbKeychain.Value Then		      //We need to add the password to the keychain if it doesnt already exist. ##		      saveToKeychain(edKey.Text)		    End If		    Close		  Else		    MsgBox "Incorrect password."		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events bCancel	#tag Event		Sub Action()		  Return		End Sub	#tag EndEvent#tag EndEvents