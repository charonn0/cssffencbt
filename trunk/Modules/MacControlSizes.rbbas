#tag ModuleProtected Module MacControlSizes	#tag Method, Flags = &h0		Sub MacControlSize(extends c as Control, assigns newSize as MacControlSize)		  if c.Handle = 0 then return		  		  declare function SetControlData lib "Carbon" (ctl as Integer, part as Integer, tagName as Integer, size as Integer, byref data as MacControlSize) as Integer		  		  dim err as Integer		  err = SetControlData( c.Handle, 0, kControlSizeTag, 2, newSize )		End Sub	#tag EndMethod	#tag Constant, Name = kControlSizeTag, Type = Double, Dynamic = False, Default = \"\'size\'", Scope = Private	#tag EndConstant	#tag Enum, Name = MacControlSize, Flags = &h0		Normal		  Small		  Large		Mini	#tag EndEnum	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule