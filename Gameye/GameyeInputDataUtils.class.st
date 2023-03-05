"
This class format Gameye input files (as exported .csv sheet) to be correct for parsing datas.
Exported files are not supported in a lot of cases and this utils class have the job to make the file readeable and fix all exporting problems.
"
Class {
	#name : #GameyeInputDataUtils,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #private }
GameyeInputDataUtils class >> extractCellsFromLine: aString [

	| cells index |
	cells := aString substrings: ','.
	cells size = GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifTrue:[ ^ cells ].

	"A comma is inside datas, probably editor name or comment, try to cut manually and format the comma into HTML code &#44;"
	cells := OrderedCollection new.
	index := aString findString: '"'.
	
	^cells asArray
]

{ #category : #formatting }
GameyeInputDataUtils class >> prepareExportedSpreadsheet: aReadstream [
	"Return a readstream of an exported spreadsheet with fixing all knowns generation knowns problems"

	| line formattedReadStream |
	"Check if the first line (column head) have all requested columns"
	line := aReadstream nextLine.
	(line substrings: ',') size = GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifFalse: [ ^ nil ]. 
	
	"Build the new stream"
	formattedReadStream := ZnCharacterWriteStream on: (String new: aReadstream size) encoding: (aReadstream encoder).
	"formattedReadStream := ReadWriteStream on: (String new: aReadstream size)."
	formattedReadStream nextPutAll: line; cr.

	line := aReadstream nextLine.

	[ line notNil ] whileTrue:[  | cells |

		cells := self extractCellsFromLine: line.
		cells do:[ :c | | formattedCell |
			"Cell processing"
			"Remove not necessary spaces at the start or the end"
			formattedCell := c withBlanksCondensed withoutQuoting.
			formattedCell := formattedCell copyReplaceAll: '"' with: '""'.
			formattedReadStream nextPutAll: formattedCell.
		] separatedBy:[ formattedReadStream nextPut: $, ].
	
		formattedReadStream cr.
		
		line := aReadstream nextLine.
	].

	^formattedReadStream
]
