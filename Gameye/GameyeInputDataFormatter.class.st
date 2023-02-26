"
This class format Gameye input files (as exported .csv sheet) to be correct for parsing datas.
Exported files are not supported in a lot of cases and this utils class have the job to make the file readeable and fix all exporting problems.
"
Class {
	#name : #GameyeInputDataFormatter,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #formatting }
GameyeInputDataFormatter class >> formatExportedSpreadsheet: aReadstream [
	"Take and return a readstream of an exported spreadsheet and format it with fixing all knowns generation problems"
	
	^aReadstream copy
]
