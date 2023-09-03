"
This class format Gameye input files (as exported .csv sheet) to be correct for parsing datas.
Exported files are not supported in a lot of cases and this utils class have the job to make the file readeable and fix all exporting problems.
"
Class {
	#name : #GameyeInputDataUtils,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #accessing }
GameyeInputDataUtils class >> exportedSpreadsheetColumn01Title [

	^ 'Platform'
]

{ #category : #accessing }
GameyeInputDataUtils class >> exportedSpreadsheetPeripheralType [

	^ '"Peripherals"'
]

{ #category : #accessing }
GameyeInputDataUtils class >> exportedSpreadsheetPrintMediaType [

	^ '"Print Media"'
]

{ #category : #accessing }
GameyeInputDataUtils class >> exportedSpreadsheetSystemType [

	^ '"Systems"'
]

{ #category : #accessing }
GameyeInputDataUtils class >> exportedSpreadsheetVideoGameType [

	^ '"VideoGame"'
]

{ #category : #private }
GameyeInputDataUtils class >> extractCellsFromLine: aString [
	| cells newCells safeCells type |

	cells := aString substrings: ','.
	cells size = self numberOfExportedSpreadsheetColumns ifTrue:[ ^ cells asArray ].

	"Recreate cells from 1 to 5 (no problematic cells)"
	newCells := OrderedCollection new.
	safeCells := newCells copy asArray.
	1 to: 5 do:[ :i | newCells add: (cells at: i) ].

	"Not found case : why this case can be possible ?"
	cells size > self numberOfExportedSpreadsheetColumns ifFalse:[ ^ safeCells ].

	"Processing for VideoGames or Systems"
	type := cells at: 2.
	(type = self exportedSpreadsheetVideoGameType or:[type = self exportedSpreadsheetSystemType or:[type = self exportedSpreadsheetPeripheralType]]) ifTrue:[ | rebuildedCells |

		"A comma or more are inside datas, probably inside string datas as title or editor name or comment (etc.).
		Try to cut manually and format the comma into HTML code &#44; to ignor the comma during parsing"

		"Problematic cells : 6, 7, 8, 21, extract all cells of the array to rebuild the correct number of cell"
		rebuildedCells := self rebuildCells: (cells copyFrom: 6 to: cells size).
		newCells addAll: rebuildedCells.
	].

	newCells size ~= self numberOfExportedSpreadsheetColumns ifTrue:[
		"Not found case : why this case can be possible ?"
		^ safeCells
	].

	^newCells asArray
]

{ #category : #accessing }
GameyeInputDataUtils class >> numberOfExportedSpreadsheetColumns [

	^ 21
]

{ #category : #formatting }
GameyeInputDataUtils class >> prepareExportedSpreadsheetReadStream: aReadstream [
	"Return a ReadStream of an exported SpreadSheet file with fixing all knowns generation knowns problems"

	| line fixedStream columns |
	aReadstream ifNil:[ ^ self signalNotSupportedSpreadsheetFile ].

	"Check if the first line (normally it's columns head) have the good number of columns and the good first title"
	line := aReadstream nextLine.
	columns := (line substrings: ',').
	columns size = self numberOfExportedSpreadsheetColumns ifFalse: [ ^ self signalNotSupportedSpreadsheetFile ].
	columns first = self exportedSpreadsheetColumn01Title ifFalse:[ ^ self signalNotSupportedSpreadsheetFile ].

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
			(columnId = 2 and:[cell = self exportedSpreadsheetPrintMediaType]) ifTrue:[
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

{ #category : #private }
GameyeInputDataUtils class >> rebuildCells: aCellsArray [
	| newCells |

	newCells := OrderedCollection new.
	1 to: aCellsArray size do:[ :index | | cell previousCell currentCell nextCell cells |

		previousCell := ((index - 1) > 0) ifTrue:[aCellsArray at: (index - 1)] ifFalse:[nil].
		currentCell := aCellsArray at: index.
		nextCell := (aCellsArray size >= (index + 1)) ifTrue:[aCellsArray at: (index + 1)] ifFalse:[nil].

		"Remove no necessary blanks"
		cell := currentCell withBlanksCondensed.

		"Check if the begin and the end of the cell are quotes, if not this is probably that the cell contains a comma and try to recompose with next cell"
		(cell first = $" and:[cell last = $"]) ifTrue:[
			newCells add: cell.
		] ifFalse:[
			nextCell ifNotNil:[
				"Problem detected : a comma is present in the string, recompose the string with the next cell"
				currentCell := currentCell,'&#44;', nextCell.

				"Rebuild all the cells with removing the next cell"
				cells := OrderedCollection with: currentCell.
				cells addAll: (aCellsArray copyFrom: (index + 2) to: (aCellsArray size)).

				newCells := newCells asOrderedCollection.
				newCells addAll: (self rebuildCells: cells).
				^ newCells asArray

			].
		].

	].

	^newCells asArray
]

{ #category : #'error signalling' }
GameyeInputDataUtils class >> signalNotSupportedSpreadsheetFile [

	^ NotSupportedSpreadsheetFileGameyeError signal 
]

{ #category : #'see class side' }
GameyeInputDataUtils >> seeClassSide [
]
