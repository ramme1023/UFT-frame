'This is where we can handle all our Reporting Functions 

Function EnvVariables()
	Environment.Value("TestResultPath") = Environment.Value("TestDir")&"\Results"
	Environment.Value("ArchivePath") = Environment.Value("TestDir")&"\Archive"
	Environment.Value("FormDate") = Day(now)&"_"&Month(now)&"_"&Year(now)&"_"&Hour(now)&"'_"&Minute(now)&"''_"&Second(now)
	Environment.Value("TestStep") = 1
	Environment.Value("ScreenCounter") = 1
	Environment("ErrorFlag") = 0
	Environment.Value("ReusableActionName") = ""
	
	
End Function

