"
This class read datas exported from Gameye.
Data can be a file reference.
"
Class {
	#name : #GameyeCollectionFactory,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #private }
GameyeCollectionFactory class >> createCollectionFromDataArray: anArray [
	| collection |
	
	collection := GameyeCollection new.
	anArray ifNil: [ ^ collection ].
	
	anArray do:[ :e | | collectible |
		e size = 21 ifTrue:[
			collectible := GameyeCollectible type: (e at: 2).
			collectible platform: (e at: 1).
			collectible isOwned: (e at: 3).
			collectible isForSale: (e at: 4).
			collectible isOnWishList: (e at: 5).
			collectible title: (e at: 6).
			
			collection addCollectible: collectible.
		].	
	].
	
	^collection
]

{ #category : #reading }
GameyeCollectionFactory class >> createCollectionFromExportedSpreadsheet: aFileReference [

	| readStream neoCSVReader array |
	aFileReference ifNil:[ ^ nil ].
	aFileReference isFile ifFalse:[ ^ nil ].
	
	self flag:'PLA : recover the date into the file (if not rename)'.
	self flag:'PLA : problem with : "Ivan "Ironman" Stewart''s Super Off Road"'.
	
	readStream := aFileReference readStream.
	"readStream := GameyeInputDataFormatter formatExportedSpreadsheet: readStream."
	
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
	
	^self createCollectionFromDataArray: array
]
