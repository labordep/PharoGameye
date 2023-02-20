Class {
	#name : #GameyeExamples,
	#superclass : #Object,
	#category : #'Gameye-Examples'
}

{ #category : #'1 - load datas' }
GameyeExamples class >> loadExportedSpreadsheet [
	"Open a file browser and load a .csv file exported with the application"
	<script>
	
	| neoCSVReader fileReference array |
	"Cannot known to open a native OS file dialog, so use the pharo not very praticle file dialog :("
	fileReference := UIManager default chooseExistingFileReference: nil extensions: #('csv') path: FileSystem workingDirectory.
	(fileReference isNil or:[fileReference isFile not]) ifTrue:[ ^ self ].
	
	neoCSVReader := NeoCSVReader on: (fileReference readStream).
	array := neoCSVReader 
		separator: $,; 
		skipHeader; 
		addField; "Platform"
		addSymbolField; "Type"
		addFieldConverter: [ :string | string = '1' ]; "Owned"
		addFieldConverter: [ :string | string = '1' ]; "ForSale"
		addFieldConverter: [ :string | string = '1' ]; "Wishlist"
		addFieldConverter: [ :string | string = '(null)' ifTrue:[nil] ifFalse:[string] ]; "Title"
		addFieldConverter: [ :string | string = '(null)' ifTrue:[nil] ifFalse:[string] ]; "Publisher"
		addFieldConverter: [ :string | string = '(null)' ifTrue:[nil] ifFalse:[string] ]; "Developer"
		addFieldConverter: [ :string | Date readFrom: string pattern: 'dd/mm/yyyy' ]; "DateAdded"
		addSymbolField; "Ownership"
		addFloatField; "PriceLoose"
		addFloatField; "PriceCIB"
		addFloatField; "PriceNew"
		addFloatField; "YourPrice"
		"Sometime is equals to '?', this is probably a bug"
		addFieldConverter: [ :string | (string isNil or:[ string isEmpty or:[string = '?']]) ifTrue:[-1] ifFalse:[NeoNumberParser parse: string] ]; "PricePaid"
		"Sometime is equals to '?', this is probably a bug"
		addFieldConverter: [ :string | (string isNil or:[ string isEmpty or:[string = '?']]) ifTrue:[-1] ifFalse:[NeoNumberParser parse: string] ]; "ItemCondition"
		"Sometime is equals to '?', this is probably a bug"
		addFieldConverter: [ :string | (string isNil or:[ string isEmpty or:[string = '?']]) ifTrue:[-1] ifFalse:[NeoNumberParser parse: string] ]; "BoxCondition"
		"Sometime is equals to '?', this is probably a bug"
		addFieldConverter: [ :string | (string isNil or:[ string isEmpty or:[string = '?']]) ifTrue:[-1] ifFalse:[NeoNumberParser parse: string] ]; "ManualCondition"
		addField; "Beat"
		addField; "PlayedCompletion"
		addField; "Notes"
		upToEnd.
		
	array inspect
]

{ #category : #'see class side' }
GameyeExamples >> seeClassSide [
]
