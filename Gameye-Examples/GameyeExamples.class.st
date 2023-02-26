Class {
	#name : #GameyeExamples,
	#superclass : #Object,
	#category : #'Gameye-Examples'
}

{ #category : #'1 - load datas' }
GameyeExamples class >> loadExportedSpreadsheet [
	"Open a file browser and load a .csv file exported with the application"
	<script>
	
	| neoCSVReader fileReference array readStream |
	"Cannot known to open a native OS file dialog, so use the pharo not very praticle file dialog :("
	fileReference := UIManager default chooseExistingFileReference: nil extensions: #('csv') path: FileSystem workingDirectory.
	(fileReference isNil or:[fileReference isFile not]) ifTrue:[ ^ self ].
	
	self flag:'PLA : recover the date into the file (if not rename)'.
	self flag:'PLA : problem with : "Ivan "Ironman" Stewart''s Super Off Road"'.
	
	readStream := fileReference readStream.
	readStream := GameyeInputDataFormatter formatExportedSpreadsheet: readStream.
	
	neoCSVReader := NeoCSVReader on: readStream.
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
		"Sometime is equals to ' -1.0' opr '-1.0', this is probably a bug"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "PriceLoose"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "PriceCIB"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "PriceNew"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "YourPrice"
		"Sometime is equals to '?', this is probably a bug"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "PricePaid"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "ItemCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "BoxCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [-1] ]; "ManualCondition"
		addField; "Beat"
		addField; "PlayedCompletion"
		addField; "Notes"
		upToEnd.
		
	array inspect
]

{ #category : #'see class side' }
GameyeExamples >> seeClassSide [
]
