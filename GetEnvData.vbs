'This is where we can Read Data from Excel '

' Code to read inputs from the Excel 

'Create a Dictionary Object For 
Set ObjDic = CreateObject("Scripting.Dictionary")
Dim DicKey, DicVal
'ObjDic.Add "Name1", "Ramesh "
'ObjDic.Add "Age1", "25"

'******** ************ ******** Reading Data from Excel  - Ramesh 16 Apr 2019  ********** ************** **********
Set ObjExcel = CreateObject("Excel.Application")   ' Readin for the 
ObjExcel.Visible = False
Set ExcelBook = ObjExcel.Workbooks.Open("C:\Users\UX015235\Desktop\BaseFrameWork\TestData\TestData.xlsx")
Set ObjSheet = ExcelBook.worksheets("TestData")

Rcount = ObjSheet.usedrange.rows.count
Ccount = ObjSheet.usedrange.columns.count
					  
For temp = 1 To Rcount Step 1
 Testname = ObjSheet.cells(temp,1).Value
	If (Testname = Environment.Value("TestName")) Then
'		TC = temp
		For TC = 1 To Ccount Step 1
		  DicKey = ObjSheet.cells(1,TC).Value
		  DicVal = ObjSheet.cells(temp,TC).Value
		
		  ObjDic.Add DicKey, DicVal
		  
		Next
		
		Exit For
	End If

Next

ExcelBook.Close
ObjExcel.Quit
Set ObjExcel= Nothing

Public Function GetEnvData(name)
	GetEnvData= ObjDic.Item(name)
End Function 

