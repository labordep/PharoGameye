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
GameyeInputDataUtils class >> prepareExportedSpreadsheetReadStream: aReadstream [
	"Return a ReadStream of an exported SpreadSheet file with fixing all knowns generation knowns problems"

	| line fixedStream columns |
	aReadstream ifNil:[ ^ nil ].

	"Check if the first line (normally it's columns head) have the good number of columns and the good first title"
	line := aReadstream nextLine.
	columns := (line substrings: ',').
	columns size = GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifFalse: [ ^ nil ].
	columns first = GameyeCollectionFactory exportedSpreadsheetColumn01Title ifFalse:[ ^ nil ].

	"Build the new stream"
	fixedStream := ReadWriteStream on: String new.
	fixedStream nextPutAll: line; cr.

	line := aReadstream nextLine.

	[ line notNil ] whileTrue:[  | cells columnId |
		cells := self extractCellsFromLine: line.
		columnId := 1.
		"Cell content processing"
		cells do:[ :cell | | formattedCell |

			"Print media type as a symbol without space"
			(columnId = 2 and:[cell = '"Print Media"']) ifTrue:[
				formattedCell := '"PrintMedia"'.
			] ifFalse:[
				"Remove not necessary spaces at the start or the end"
				formattedCell := cell withBlanksCondensed withoutQuoting.
				formattedCell := formattedCell copyReplaceAll: '"' with: '""'.
			].

			fixedStream nextPutAll: formattedCell.

		] separatedBy:[
			fixedStream nextPut: $,.
			columnId := columnId + 1
		].

		fixedStream cr.

		line := aReadstream nextLine.
	].

	^ fixedStream reset
]
