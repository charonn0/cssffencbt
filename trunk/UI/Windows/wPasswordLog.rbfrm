#tag WindowBegin Window wPasswordLog   BackColor       =   16777215   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "False"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   385   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   326659859   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   0   Resizeable      =   "True"   Title           =   "Password Log"   Visible         =   "True"   Width           =   642   Begin DGlogListBox lbLog      AutoDeactivate  =   "True"      AutoHideScrollbars=   "True"      Bold            =   ""      ColumnCount     =   3      ColumnsResizable=   "True"      ColumnWidths    =   80,300      ControlOrder    =   0      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   -1      Enabled         =   "True"      EnableDrag      =   ""      EnableDragReorder=   "True"      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   "True"      HeadingIndex    =   -1      Height          =   351      HelpTag         =   ""      Hierarchical    =   ""      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   "Date	File(s) Encrypted	Password"      Italic          =   ""      Left            =   20      LockBottom      =   "False"      LockLeft        =   "True"      LockRight       =   "True"      LockTop         =   "True"      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   "True"      SelectionType   =   0      TabPanelIndex   =   0      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      UseFocusRing    =   "False"      Visible         =   "True"      Width           =   602      _ScrollOffset   =   0      _ScrollWidth    =   -1      BehaviorIndex   =   0   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  //Fill listbox with data		  ''First we will clear out any rows that might exist in the listbox from the last test...		  'ListBox1.DeleteAllRows		  '		  ''Declare a string array to hold the parsed comment lines...		  'Dim strLines() as String		  '		  ''Set up the parameters passed to the CommentParser method...		  'Dim strComment as string = txtComment.Text		  'Dim intWidth as Integer = Listbox1.Column(1).WidthActual		  'Dim strFont as string = ListBox1.TextFont		  'Dim intFontSize as integer = ListBox1.TextSize		  '		  ''Call the CommentParser method		  'strLines = CommentParser(strComment, intWidth, strFont, intFontSize)		  '		  ''Now add the parsed comment to the listbox rows...		  'Dim strElement as string		  '		  'For each strElement in strLines		  'ListBox1.AddRow("")		  'ListBox1.Cell(ListBox1.LastIndex,1) = strElement		  'Next		End Sub	#tag EndEvent	#tag Event		Sub Close()		  //Save the log on window close		  saveLog		End Sub	#tag EndEvent	#tag Method, Flags = &h21		Private Sub saveLog()		  Dim pwrdLog As FolderItem 		  pwrdLog = SpecialFolder.ApplicationData'.Child("BitClamp").Child("PasswordLog.bclog")		  pwrdLog = pwrdLog.Child("BitClamp")		  break		  pwrdLog = pwrdLog.Child("PasswordLog.bclog")		  break		  Dim outStream As BinaryStream = pwrdLog.CreateBinaryFile("")		  Dim hasher As New SHA_512		  		  //The file format is as follows		  //A hash of the password.		  //The number of items in the db.		  //Every date		  //Every folder		  //Every password.		  		  //Write the password hash.		  hasher.Update(suppliedPassword)		  outStream.Write(hasher.Final)		  		  //Write the amount of items		  outStream.Write(str(lbLog.ActualRowCount))		  		  //Loop through and save each item.		  For i As Integer = 0 To lbLog.ActualRowCount		    outStream.WritePString(lbLog.ReadActualCell(i,0))		    outStream.WritePString(lbLog.ReadActualCell(i,1))		    outStream.WritePString(lbLog.ReadActualCell(i,2))		  Next		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Function CommentParser(strText As String, intMaxWidth As Integer, strFontType As String, intFontSize As Integer) As String()		  'We will add parsed comment lines to an string array, then we will use it as the method's return...		  Dim strCommentLines() as String		  		  'Clean up any leading or trailing spaces in the comment to make life simpler for the parser...		  strText = strText.Trim		  		  'Helper variables for the method...		  dim intLastPosition as Integer = 0 'Used to keep track of the last space position in the comment...		  Dim IntSpace as Integer = 0 'Used to keep track of position of space between words...		  Dim intTextWidth as Integer = 0 'Used to determine the width of a comment line...		  		  'Define a picture object to hold the text...		  Dim picString as Picture		  picString = New Picture(1, 1, 4) 'Initial size is not really important so I just specify 1, 1 here		  picString.Graphics.TextFont = strFontType		  picString.Graphics.TextSize = intFontSize		  		  Do		    'First, find the location of a space between words...		    intSpace = strtext.InStr(intLastPosition + 1, " ")		    If intSpace = 0 Then 'There are no more words left...		      intTextWidth = picString.Graphics.StringWidth(strText)		    Else		      intTextWidth = picString.Graphics.StringWidth(strText.Left(intSpace))		    End If		    		    'Write the string into the picture and determine how big it is...		    If intTextWidth > intMaxWidth Then 'whoops, string is too wide!		      strCommentLines.Append(strText.Left(intLastPosition).Trim)		      strText = strText.Mid(intLastPosition).Trim		      intSpace = 0		      intLastPosition = 0		    Else		      If intSpace = 0 Then		        Exit Do 'since there are no more words left, we can exit this loop...		      Else		        IntLastPosition = intSpace 'More words in the commeent so we need to keep parsing...		      End If		    End if		  Loop		  		  'If there is any remaining comment text, add it to the end now...		  If (strText.Len <> 0) Then		    strCommentLines.Append(strText)		  End If		  		  Return strCommentLines 'Comments are all parsed and returned as string array...		End Function	#tag EndMethod	#tag Property, Flags = &h21		Private suppliedPassword As String	#tag EndProperty#tag EndWindowCode