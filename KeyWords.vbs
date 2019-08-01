'We Can write all our Key words in the Key words file'

Function Navigate(Browser,URL)  ' Ramesh 15 - Apr - 2018
	
	SystemUtil.CloseProcessByName("iexplore.exe")
	
	SystemUtil.CloseProcessByName("iexplore.exe*32")
	SystemUtil.Run Browser, URL
	
End Function

Function TakScreenshot(name)
	Desktop.CaptureBitmap Environment.Value("TestResultPath")&"\temp\"&Environment.Value("ScreenCounter")&"!"&Environment.Value("FormDate")&".png"
	Environment.Value("ScreenCounter") = Environment.Value("ScreenCounter")+1
End Function

Function SetObject(StrObject, Value, LogicalName, Flag)
	If StrObject.Exist Then
		StrObject.Set value
		Reporter.ReportEvent micPass, LogicalName, "Passed"
		Call AppendingResult( LogicalName&" is Entered ", "Passed")
		
		ElseIf Flag = "False" Then
		Call AppendingResult(LogicalName&" is not Enetered " , "Warning")
		Reporter.ReportEvent micWarning, LogicalName, "Warning"
		
		Else
		Call AppendingResult(LogicalName&" is not Entered " , "Failed")
		Reporter.ReportEvent micFail, LogicalName, "Failed"
		ExitTest
		
	End If
End Function

Function Click(StrObject, LogicalName, Flag)
	If StrObject.Exist Then
		StrObject.Click 
		Reporter.ReportEvent micPass, LogicalName, "Passed"
		Call AppendingResult( LogicalName&" is clicked ", "Passed")
		
		ElseIf Flag = "False" Then
		Call AppendingResult( LogicalName&" is not clicked " , "Warning")
		Reporter.ReportEvent micWarning, LogicalName, "Warning"
		
		Else
		Call AppendingResult( LogicalName&" is not clicked " , "Failed")
		Reporter.ReportEvent micFail, LogicalName, "Failed"
		ExitTest
		
	End If
End Function

Function SelectList(StrObject, Value, LogicalName, Flag)
	If StrObject.Exist Then
		StrObject.Select value
		Reporter.ReportEvent micPass, LogicalName, "Passed"
		Call AppendingResult( LogicalName&" is Selected ", "Passed")
		
		ElseIf Flag = "False" Then
		Call AppendingResult( LogicalName&" is not Selected " , "Warning")
		Reporter.ReportEvent micWarning, LogicalName, "Warning"
		
		Else
		Call AppendingResult( LogicalName&" is not Selected " , "Failed")
		Reporter.ReportEvent micFail, LogicalName, "Failed"
		ExitTest
		
	End If
End Function
