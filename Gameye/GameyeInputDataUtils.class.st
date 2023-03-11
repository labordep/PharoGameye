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
	| cells newCells safeCells type |

	cells := aString substrings: ','.
	cells size = GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifTrue:[ ^ cells asArray ].

	"Recreate cells from 1 to 5 (no problematic cells)"
	newCells := OrderedCollection new.
	safeCells := newCells copy asArray.
	1 to: 5 do:[ :i | newCells add: (cells at: i) ].
	
	"Not found case : why this case can be possible ?"
	cells size > GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifFalse:[ ^ safeCells ].
	
	"Processing for VideoGames or Systems"
	type := cells at: 2.
	(type = '"VideoGame"' or:[type = '"Systems"' or:[type = '"Peripherals"']]) ifTrue:[ | rebuildedCells |
		
		"A comma or more are inside datas, probably inside string datas as title or editor name or comment (etc.). 
		Try to cut manually and format the comma into HTML code &#44; to ignor the comma during parsing"
		
		"Problematic cells : 6, 7, 8, 21, extract all cells of the array to rebuild the correct number of cell"
		rebuildedCells := self rebuildCells: (cells copyFrom: 6 to: cells size).
		newCells addAll: rebuildedCells.
	].
	
	newCells size ~= GameyeCollectionFactory numberOfExportedSpreadsheetColumns ifTrue:[
		"Not found case : why this case can be possible ?"
		^ safeCells
	].
	
	^newCells asArray
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
			nextCell isNil ifFalse:[
				"Problem detected : a comma is present in the string, recompose the string with the next cell"
				currentCell := currentCell,'&#44;', nextCell.
				
				"Rebuild all the cells with removing the next cell"
				cells := OrderedCollection with: currentCell.
				cells addAll: (aCellsArray copyFrom: (index + 2) to: (aCellsArray size)).
				
				newCells := newCells asOrderedCollection.
				newCells addAll: (self rebuildCells: cells).				
				^ newCells asArray
				
			] ifTrue:[self halt:'Unknown case'].
		].
		
	].
	
	^newCells asArray
]

{ #category : #'see class side' }
GameyeInputDataUtils >> seeClassSide [
]
