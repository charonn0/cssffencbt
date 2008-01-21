#tag WindowBegin Window wPswdStrength   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "False"   Frame           =   3   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   64   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   0   Resizeable      =   "False"   Title           =   "Password Strength"   Visible         =   "True"   Width           =   209   Begin StaticText StaticText1      AutoDeactivate  =   "True"      Bold            =   "True"      ControlOrder    =   0      DataField       =   ""      DataSource      =   ""      Enabled         =   "True"      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      Text            =   "None"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   5      Underline       =   ""      Visible         =   "True"      Width           =   100      BehaviorIndex   =   0   End   Begin Canvas cpStrength      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   ""      ControlOrder    =   1      Enabled         =   "True"      EraseBackground =   "True"      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      Top             =   27      UseFocusRing    =   "True"      Visible         =   "True"      Width           =   169      BehaviorIndex   =   1   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  Me.Left = wMain.Left + 400		  If Me.Left > Screen(0).AvailableWidth - Me.Width Then		    Me.Left = wMain.Left - Me.Width - 50		  End If		  Me.Top = wMain.Top		End Sub	#tag EndEvent	#tag Method, Flags = &h1		Protected Function calculateLevel(key as String) As Short		  '* If the password is less than 4 characters then TooShortPassword		  '* Score += password length * 4		  '* Score -= repeated characters in the password ( 1 char repetition ) ## To be done		  '* Score -= repeated characters in the password ( 2 char repetition )		  '* Score -= repeated characters in the password ( 3 char repetition )		  '* Score -= repeated characters in the password ( 4 char repetition )		  '* If the password has 3 numbers then score += 5		  '* If the password has 2 special characters then score += 5		  '* If the password has upper and lower character then score += 10		  '* If the password has numbers and characters then score += 15		  '* If the password has numbers and special characters then score += 15		  '* If the password has special characters and characters then score += 15		  '* If the password is only characters then score -= 10		  '* If the password is only numbers then score -= 10		  '		  '* If score > 100 then score = 100		  '		  'Now according to score we are going to decide the password strength		  '		  '* If 0 < score < 34 then BadPassword		  '* If 34 < score < 68 then GoodPassword		  '* If 68 < score < 100 then StrongPassword		  Dim score As Integer		  		  '* If the password is less than 4 characters then TooShortPassword		  If Len(Key) < 4 Then		    Return 1		  Else 		    '* Score += password length * 4		    Score = len(key) * 4		  End If		  		  '* If the password has 3 numbers then score += 5		  If numberCount(key) > 3 Then		    score = score + 5		  End If		  		  '* If the password has 2 special characters then score += 5		  If symbolCount(key) > 2 Then		    score = score + 5		  End If		  		  '* If the password has upper and lower character then score += 10		  If lowerCaseCount(key) > 0 AND upperCaseCount(key) > 0 Then		    score = score + 10		  End If		  		  '* If the password has numbers and characters then score += 15		  If numberCount(key) > 0 AND letterCount(key) > 0 Then		    score = score + 15		  End If		  		  '* If the password has numbers and special characters then score += 15		  If numberCount(key) > 0 AND symbolCount(key) > 0 Then		    score = score + 15		  End If		  		  '* If the password has special characters and characters then score += 15		  If symbolCount(key) > 0 AND letterCount(key) > 0 Then		    score = score + 15		  End If		  		  '* If the password is only characters then score -= 10		  If symbolCount(key) = 0 AND numberCount(key) = 0 Then		    score = score - 10		  End If		  		  '* If the password is only numbers then score -= 10		  If letterCount(key) = 0 AND symbolCount(key) = 0 Then		    score = score - 10		  End If		  		  If score > 100 then score = 100		  		  If score > 0 AND score < 34 Then '* If 0 < score < 34 then BadPassword		    Return 1		  ElseIf score > 33 AND score < 68 Then '* If 34 < score < 68 then GoodPassword		    Return 2		  Else '* If 68 < score < 100 then StrongPassword		    Return 3		  End If		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function letterCount(text as String) As Integer		  //counts number of letters in the inputted string. 		  Dim ascVal, count As Integer		  For i As Integer = 1 To Len(text)		    //Read ascii value of character		    ascVal = asc(Mid(Text, i, 1))		    //Check through ascii values of letters		    If (ascVal > 64 AND ascVal <  91) OR (ascVal > 96 AND ascVal <  123) Then		      //Its a letter		      count = count + 1		    End If		  Next i		  Return count		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function numberCount(text as String) As Integer		  //counts number of numbers in the inputted string.		  Dim ascVal, count As Integer		  For i As Integer = 1 To Len(text)		    //Read ascii value of character		    ascVal = asc(Mid(Text, i, 1))		    //Check through ascii values of numbers		    If ascVal > 47 AND ascVal <  58 Then		      //Its a number		      count = count + 1		    End If		  Next i		  Return count		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function symbolCount(text as String) As Integer		  //counts number of symbols in the inputted string.		  Dim ascVal, count As Integer		  For i As Integer = 1 To Len(text)		    //Read ascii value of character		    ascVal = asc(Mid(Text, i, 1))		    //Check through ascii values of symbols		    If (ascVal > 32 AND ascVal <  48) OR (ascVal > 57 AND ascVal <65)  OR (ascVal > 90 AND ascVal < 97) OR (ascVal > 122 AND ascVal < 127)Then		      //Its a symbol		      count = count + 1		    End If		  Next i		  Return count		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub Update(input As String)		  Select Case calculateLevel(input)		  Case 1		    //Weak password.		    StaticText1.Text = "Weak"		    StaticText1.TextColor = &cFF0906		    strength = 1		  Case 2		    //OK password.		    StaticText1.Text = "OK"		    StaticText1.TextColor = &cFFD622		    strength = 2		  Case 3		    //Strong password.		    StaticText1.Text = "Strong"		    StaticText1.TextColor = &c00B512		    strength = 3		  End Select		  cpStrength.Refresh		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Function lowerCaseCount(text As String) As Integer		  //counts number of lower case letters in the inputted string.		  Dim ascVal, count As Integer		  For i As Integer = 1 To Len(text)		    //Read ascii value of character		    ascVal = asc(Mid(Text, i, 1))		    //Check through ascii values of letters		    If (ascVal > 96 AND ascVal <  123) Then		      //Its a letter		      count = count + 1		    End If		  Next i		  Return count		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Function upperCaseCount(text As String) As Integer		  //counts number of upper case letters in the inputted string.		  Dim ascVal, count As Integer		  For i As Integer = 1 To Len(text)		    //Read ascii value of character		    ascVal = asc(Mid(Text, i, 1))		    //Check through ascii values of letters		    If (ascVal > 64 AND ascVal <  91) Then		      //Its a letter		      count = count + 1		    End If		  Next i		  Return count		End Function	#tag EndMethod	#tag Property, Flags = &h21		Private strength As Short	#tag EndProperty#tag EndWindowCode#tag Events cpStrength	#tag Event		Sub Paint(g As Graphics)		  Dim grad As Picture		  Select Case Strength		  Case 1		    //Weak password.		    grad = redStrength		    For i As short = 0 To 50		      g.DrawPicture(grad, i, 0)		    Next		  Case 2		    //OK password.		    grad = amberStrength		    For i As short = 0 To 100		      g.DrawPicture(grad, i, 0)		    Next		  Case 3		    //Strong password.		    grad = greenStrength		    For i As short = 0 To Me.Width 		      g.DrawPicture(grad, i, 0)		    Next		  End Select		  		  For i As short = 0 To (strength *50)		    g.DrawPicture(grad, i, 0)		  Next		End Sub	#tag EndEvent#tag EndEvents