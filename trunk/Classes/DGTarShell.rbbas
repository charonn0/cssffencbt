#tag ClassProtected Class DGTarShellInherits Shell	#tag Event		Sub Completed()		  //Handle any errors.		  If Me.ErrorCode <> 0 Then		    MsgBox "There was an error when archiving the data. Please report: #DGTSc" + str(ErrorCode) + EndOfLine + Result		    Return		  End If		  		  If doingDecrypt Then		    //We need to move the temp archive to the target.		    TemporaryFolder.Child("DecryptedFiles").MoveFileTo(target)		    //Update UI		    wMain.pbProgress.Maximum = 1		    wMain.pbProgress.Value = 1		    wMain.bCancel.Caption = "OK"		    wMain.bCancel.Default = True		    wMain.stReports.Text = "Decryption Finished"		    Return		  End If		  		  		  If zipFlag Then		    TemporaryFolder.Child("BitClamp_temp.tar.gz").MoveFileTo(target)		    Return		  End If		  		  		  //Check the counter to see if we are at the ubound of the array.		  If counter = Me.source.Ubound Then 		    //Check if we need to filter through gzip.		    If Me.compress Then 		      Me.Execute("gzip " + TemporaryFolder.Child("BitClamp_temp.tar").ShellPath)		      Me.zipFlag = True		      Return		    End If		    		    //We are, so we need to finish up.		    TemporaryFolder.Child("BitClamp_temp.tar").MoveFileTo(target)		    		    If Me.encrypt Then		      		      //We need to set off a new instance of BCEncryptor.		      If NOT enc.EncryptTask Then		        MsgBox("An error occured during the encryption process. If the issue persists please report error code:" + enc.LastErrorCode)		        wMain.ResetWindow		        Return		      End If		    End If		    		  Else		    //There are more files to append.		    counter = counter + 1		    'tar -C /Users/Danny/Documents --append --file=/Users/Danny/Desktop/test.tar MRC.vpdoc		    Me.Execute("tar -C " + source(counter).Parent.ShellPath + " --append --file=" + TemporaryFolder.Child("BitClamp_temp.tar").ShellPath + " " + source(counter).Name.ReplaceAll(" ", "\ ")) 		  End If		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub Archive(source() As FolderItem, target As FolderItem, compress As Boolean, newEncrypt As Boolean)		  '=======================================================================		  'Params:		  'source: the source array for the archive.		  'compress: if the archive needs to be compressed.		  'newEncrypt: if we want to go on and encrypt the data once we're done.		  'target: the folderitem where the result will go, if we are encrypting the data the result will be the final BitClamp file.		  '=======================================================================		  		  //Initializations		  Me.source = source		  Me.target = target		  Me.compress = compress		  Me.doingDecrypt = False		  Me.encrypt = newEncrypt		  		  //Create the archive and add the first item.		  counter = 0		  		  'If compress Then		  'Me.Execute("tar -C " + source(0).Parent.ShellPath + " -cvzf " + TemporaryFolder.Child("BitClamp_temp.tar").ShellPath + " " + source(0).Name.ReplaceAll(" ", "\ "))		  'Else		  Me.Execute("tar -C " + source(0).Parent.ShellPath + " -cvf " + TemporaryFolder.Child("BitClamp_temp.tar").ShellPath + " " + source(0).Name.ReplaceAll(" ", "\ "))		  'End If		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UnArchive(source As FolderItem, target As FolderItem, decompress As Boolean)		  me.target = target		  doingDecrypt = True		  TemporaryFolder.Child("DecryptedFiles").CreateAsFolder		  If decompress Then		    Me.Execute("tar xfz " + source.ShellPath + " -C " + TemporaryFolder.Child("DecryptedFiles").ShellPath)		  Else		    Me.Execute("tar xf " + source.ShellPath + " -C " + TemporaryFolder.Child("DecryptedFiles").ShellPath)		  End If		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Constructor()		  Me.Mode = 1 'Set the shell to be asyncronus to keep the app responsive		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Cancel()		  Me.Close		End Sub	#tag EndMethod	#tag Property, Flags = &h21		#tag Note			Holds which phase we are currently in, used primarily to cycle through the source array. that way we can use the completed event to append more files or end the archiving process.		#tag EndNote		Private counter As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private source() As FolderItem	#tag EndProperty	#tag Property, Flags = &h21		Private target As FolderItem	#tag EndProperty	#tag Property, Flags = &h21		Private compress As Boolean	#tag EndProperty	#tag Property, Flags = &h21		Private encrypt As Boolean	#tag EndProperty	#tag Property, Flags = &h21		Private doingDecrypt As Boolean	#tag EndProperty	#tag Property, Flags = &h21		Private zipFlag As Boolean	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="TimeOut"			Visible=true			EditorType="Integer"			InheritedFrom="Shell"		#tag EndViewProperty		#tag ViewProperty			Name="Mode"			Visible=true			EditorType="Integer"			InheritedFrom="Shell"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass