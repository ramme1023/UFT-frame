'Driver Script'
Function Driver()
	Call EnvVariables()
	Call FolderStructure()
	Call CreateResultHTML()
	
	ReusableActions = ObjDic.Item("TestScenario")
	ReusableActions = Split(ReusableActions, "|")
	For i = 0 To UBound(ReusableActions) Step 1
		LoadAndRunAction "C:\Users\UX015235\Desktop\BaseFrameWork\ReusableActions\"& ReusableActions(i), ReusableActions(i)
	Next
End Function
