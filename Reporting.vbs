'This is where we can handle all our Reporting Functions 
Function FolderStructure()
	
	Set FSO = CreateObject("Scripting.FileSystemObject")

	If FSO.FolderExists(Environment.Value("TestResultPath")) = False Then
	
		Fso.CreateFolder(Environment.Value("TestResultPath"))
		FSO.CreateFolder(Environment.Value("TestResultPath")&"\temp")
		
		Else 
		
		If (FSO.FolderExists(Environment.Value("ArchivePath")) = False ) Then
			FSO.CreateFolder(Environment.Value("ArchivePath"))
			FSO.MoveFolder Environment.Value("TestResultPath"), Environment.Value("ArchivePath")&"\"
			
			FSO.MoveFolder Environment.Value("ArchivePath")&"\Results", Environment.Value("ArchivePath")&"\Results_"&Environment.Value("FormDate")
			Fso.CreateFolder(Environment.Value("TestResultPath"))
			FSO.CreateFolder(Environment.Value("TestResultPath")&"\temp")
			
			Else
			FSO.MoveFolder Environment.Value("TestResultPath"), Environment.Value("ArchivePath")&"\"
			
			FSO.MoveFolder Environment.Value("ArchivePath")&"\Results", Environment.Value("ArchivePath")&"\Results_"&Environment.Value("FormDate")
			Fso.CreateFolder(Environment.Value("TestResultPath"))
			FSO.CreateFolder(Environment.Value("TestResultPath")&"\temp")
			
			
		End If
		
	
	
	End If

End Function

Function CreateResultHTML()
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set MyFile = FSO.CreateTextFile (Environment.Value("TestResultPath")&"\"&Environment.Value("TestName")&".html", True)
	
	MyFile.WriteLine("<html><head><title>Test Script Execution Report</title></head>")
	MyFile.WriteLine("<body><table border='1' width='100%' bordercolorlight='#C0C0C0' cellspacing='0' cellpadding='0' bordercolordark='#C0C0C0' bordercolor='#C0C0C0' height='33'>")
	MyFile.WriteLine("<tr><td width='100%' colspan='4' height='28' bgcolor='#dcedeb' ><p align='center'><b><font face='Verdana' size='3' color='#000080'>Test Script Execution Report</font></b></td></tr>")
	MyFile.WriteLine("</table>")

	MyFile.WriteLine("<table border='1' width='100%' bordercolordark='#C0C0C0' cellspacing='0' cellpadding='0' bordercolorlight='#C0C0C0' bordercolor='#C0C0C0' height='40'>")	
	
	'============== Result Column Header =====================
	MyFile.WriteLine("<tr><td width='5%' align='center'  bgcolor = '#d6d8db' height='35'><b>")
	MyFile.WriteLine("<font face='Arial Black' size='2' color='#000000' align='center'>S. No.</font></b></td>")
	MyFile.WriteLine("<td width='20%' align='center' bgcolor = '#d6d8db'  height='35'><b>")
	''MyFile.WriteLine("<font face='Verdana' size='2' color='#FFFFFF'>Step Description</font></b></td>")
	MyFile.WriteLine("<font face='Arial Black' size='2' color='#000000' align='center'>Reusable action name </font></b></td>")
	MyFile.WriteLine("<td width='65%' align='center' bgcolor = '#d6d8db'  height='35'><b>")
	''MyFile.WriteLine("<font face='Verdana' size='2' color='#FFFFFF'>Details</font></b></td>")
	MyFile.WriteLine("<font face='Arial Black' size='2' color='#000000'>Test Step Description </font></b></td>")
	MyFile.WriteLine("<td width='10%' height='35' bgcolor = '#d6d8db' align='center'><b>")
	''MyFile.WriteLine("<font face='Verdana' size='2' color='#FFFFFF'>Status</font></b></td></tr>")
	MyFile.WriteLine("<font face='Arial Black' size='2' color='#000000'>Test Step Status</font></b></td></tr>")
			
	' Close the file
	MyFile.Close
	Set FSO = Nothing
	Set MyFile = Nothing
	
End Function

Function AppendingResult(StepDescription, Status)

	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set MyFile = FSO.OpenTextFile (Environment.Value("TestResultPath")&"\"&Environment.Value("TestName")&".html", 8, True)
	
	MyFile.WriteLine("<tr><td width='5%' align='center'  height='35'><b>")
	MyFile.WriteLine("<font face='Verdana' size='2' color='#000000' align='center'>"&Environment.Value("TestStep")&"</font></b></td>")
	MyFile.WriteLine("<td width='20%' align='center'  height='35'><b>")
	''MyFile.WriteLine("<font face='Verdana' size='2' color='#FFFFFF'>Step Description</font></b></td>")
	MyFile.WriteLine("<font face='Verdana' size='2' color='#000000' align='center'>"&Environment.Value("ReusableActionName") &"</font></b></td>")
	MyFile.WriteLine("<td width='65%' align='center'  height='35'><b>")
	''MyFile.WriteLine("<font face='Verdana' size='2' color='#FFFFFF'>Details</font></b></td>")
	MyFile.WriteLine("<font face='Verdana' size='2' color='#000000'>"&StepDescription&"</font></b></td>")
	MyFile.WriteLine("<td width='10%' height='35' align='center'><b>")
	
	If Status = "Passed" Then
		MyFile.WriteLine("<font face='Verdana' size='2' color='green'>"& Status &"</font></b></td></tr>")
		
		ElseIf Status = "Failed" Then
		MyFile.WriteLine("<font face='Verdana' size='2' color='red'>"& Status &"</font></b></td></tr>")
		
		Else 
		MyFile.WriteLine("<font face='Verdana' size='2' color='yellow'>"& Status &"</font></b></td></tr>")
		
	End If
	
	Environment.Value("TestStep") = Environment.Value("TestStep")+1
End Function
