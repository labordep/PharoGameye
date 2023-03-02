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
	
	| line formattedReadStream |
	self flag:'PLA : problem with : "Ivan "Ironman" Stewart''s Super Off Road"'.

	formattedReadStream := ReadWriteStream on: (String new: aReadstream size).

	"ignore first line (column head)"
	line := aReadstream nextLine.
	formattedReadStream nextPutAll: line; cr.
	
	self flag:'PLA inverser le whiletrue'.
	[ line notNil ] whileTrue:[ | cells |
		line := aReadstream nextLine.
		line ifNotNil:[
			cells := line substrings: ','. self flag:'ça ne suffit pas car des fois il y a des virgules dans le titre, developpeur ou le commentaire ? A verifier si ce cas existe dans le fichier a l export'.
			cells do:[ :c | | formattedCell |
				"Cell processing"
				"Remove not necessary spaces at the start or the end"
				formattedCell := c withBlanksCondensed withoutQuoting.	
				formattedCell := formattedCell copyReplaceAll: '"' with: '""'.
				formattedReadStream nextPutAll: formattedCell.
			] separatedBy:[ formattedReadStream nextPut: $, ].
			formattedReadStream cr.
		].
	].
	
	^formattedReadStream
]
