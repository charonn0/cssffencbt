#tag ClassProtected Class BCTagger	#tag Method, Flags = &h0		Sub CreateTag(Source as Folderitem)		  // This assumes that the class has the encryptiontype, file name and key sent to it. the key is hashed in this part.		  Dim h as new SHA_512		  		  h.Update(q)		  q = h.Final		  		  Dim stream as BinaryStream		  		  stream = Source.OpenAsBinaryFile(True)		  		  While Stream = Nil		    App.DoEvents		  Wend		  stream.WritePString("<HEAD>__BCEFCDX__VER__</HEAD>")		  stream.WritePString("<kFileTypeVersion>" + str(BitClamp.kFileTypeVersion) + "</kFileTypeVersion>")		  //Write encryption type as an integer to protect the filetype		  Select Case EncryptionType		  Case "Blowfish"		    stream.WritePString("<x>0</x>")		  Case "Serpent"		    stream.WritePString("<x>1</x>")		  Case "AES"		    stream.WritePString("<x>2</x>")		  End Select		  		  stream.WritePString(q)		  		  Me.TagLength = stream.Position		  stream.close		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function CheckTag(Source as Folderitem) As Boolean		  //Recieves a folderitem and returns true if the file is tagged then sets the class properties to the value of the tags		  '=================		  Dim stream As BinaryStream		  Dim block As MemoryBlock		  Dim count As UInt64		  Dim found As Boolean		  '=================		  		  stream = Source.OpenAsBinaryFile		  		  If Stream<>Nil then		    		    If  stream.ReadPString <> "<HEAD>__BCEFCDX__VER__</HEAD>" then		      //stream through to find it.		      count = 0		      While NOT stream.EOF AND found = False		        Block = stream.Read(20000)		        //If there is either a head or ending head tag (could be another form of xml file)		        If InStr(Block, "<HEAD>") > 0 OR InStr(Block, "</HEAD>") > 0 Then		          //Have we got a head tag		          If InStr(Block, "<HEAD>") > 0 Then		            //If so we move the location after saving the original one (in case it isnt really our tag and we		            //have to continue the loop		            CurrentTagLocation = stream.Position - 20000 + Instr(Block, "<HEAD>") - 2		            heldLocation = Stream.Position 'Original location is saved here		            Stream.Position = CurrentTagLocation		            		            //Is it actually a bitclamp tag.		            If Stream.ReadPString = "<HEAD>__BCEFCDX__VER__</HEAD>" Then		              //Found and exit the loop.		              Found = True		              exit		            Else		              //If not we reset the stream and continue the loop.		              Stream.Position = heldLocation		            End If		          Else		            CurrentTagLocation = stream.Position - 20000 + Instr(Block, "</HEAD>") - 24		            		            //Same procedure as above		            heldLocation = Stream.Position 'Original location is saved here		            Stream.Position = CurrentTagLocation		            		            //Is it actually a bitclamp tag.		            If Stream.ReadPString = "<HEAD>__BCEFCDX__VER__</HEAD>" Then		              //Found and exit the loop.		              Found = True		              exit		            Else		              //If not we reset the stream and continue the loop.		              Stream.Position = heldLocation		            End If		          End If		          		        End If		      Wend		      //When we have found the tag we can then go ahead and decrypt as usual.		      If found = True Then		        Me.IsBitClamp = True		        Stream.Position = CurrentTagLocation + 30		        Me.kFileTypeVersion = val(ParseLine(Stream.ReadPString, "kFileTypeVersion"))		        Select Case ParseLine(stream.ReadPString, "x")		        Case "0"		          Me.EncryptionType = "Blowfish"		        Case "1"		          Me.EncryptionType = "Serpent"		        Case "2"		          Me.EncryptionType = "AES"		        End Select		        Me.q = stream.ReadPString		        Me.TagLength = stream.Position - CurrentTagLocation		        Return True		      Else		        Return False		      End If		    Else		      Me.IsBitClamp = True		      Me.kFileTypeVersion = val(ParseLine(stream.ReadPString, "kFileTypeVersion"))		      Select Case ParseLine(stream.ReadPString, "x")		      Case "0"		        Me.EncryptionType = "Blowfish"		      Case "1"		        Me.EncryptionType = "Serpent"		      Case "2"		        Me.EncryptionType = "AES"		      End Select		      Me.q = stream.ReadPString		      Me.TagLength = stream.Position		      Return True		    End If		  Else		    Return False		  End If		End Function	#tag EndMethod	#tag Property, Flags = &h0		IsBitClamp As Boolean	#tag EndProperty	#tag Property, Flags = &h0		FileName As String	#tag EndProperty	#tag Property, Flags = &h0		EncryptionType As String	#tag EndProperty	#tag Property, Flags = &h0		q As String	#tag EndProperty	#tag Property, Flags = &h0		TagLength As Integer	#tag EndProperty	#tag Property, Flags = &h0		kFileTypeVersion As Integer	#tag EndProperty	#tag Property, Flags = &h21		Private tempPosition As UInt64	#tag EndProperty	#tag Property, Flags = &h21		Private heldLocation As UInt64	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="IsBitClamp"			Group="Behavior"			InitialValue="0"			Type="Boolean"		#tag EndViewProperty		#tag ViewProperty			Name="FileName"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="EncryptionType"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="q"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"		#tag EndViewProperty		#tag ViewProperty			Name="TagLength"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="kFileTypeVersion"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass