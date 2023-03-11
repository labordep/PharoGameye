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
		e size = self numberOfExportedSpreadsheetColumns ifTrue:[

			"Create the collectible"
			collectible := GameyeCollectible type: (e at: 2).
			collectible platform: (e at: 1).
			collectible isOwned: (e at: 3).
			collectible isForSale: (e at: 4).
			collectible isOnWishList: (e at: 5).
			collectible title: (e at: 6).

			"Processing for unknown collectible : conserve original datas to have a post analyse"
			collectible isUnknown ifTrue:[
				collectible rawDatas: e.
			].

			collection addCollectible: collectible.
		].
	].

	^collection
]

{ #category : #reading }
GameyeCollectionFactory class >> createCollectionFromExportedSpreadsheet: aFileReference [
	| readStream array collection date |

	aFileReference ifNil:[ ^ nil ].
	aFileReference isFile ifFalse:[ ^ nil ].

	readStream := GameyeInputDataUtils prepareExportedSpreadsheetReadStream: aFileReference readStream.
	array := self parseExportedSpreadsheetReadStream: readStream.

	collection := (self createCollectionFromDataArray: array) ifNil:[ ^ nil ].

	"Check if the date is on the filename and add it to the collection data"
	date := self getDateFromExportedSpreadsheetFilename: (aFileReference path basename).
	collection date: date.

	^ collection
]

{ #category : #accessing }
GameyeCollectionFactory class >> exportedSpreadsheetColumn01Title [

	^ 'Platform'
]

{ #category : #reading }
GameyeCollectionFactory class >> getDateFromExportedSpreadsheetFilename: aString [

	| a |
	aString ifNil:[ ^ nil ].

	"Check if the date is on the filename and add it to the collection data"
	(('##_##_####_*.csv' match: aString) or:[('#_##_####_*.csv' match: aString) or:[('#_#_####_*.csv' match: aString)]]) ifFalse:[ ^ nil ].

	a := (aString substrings: '_').
	^ Date newDay: (a at: 2) asInteger month: (a at: 1) asInteger year: (a at: 3) asInteger
]

{ #category : #accessing }
GameyeCollectionFactory class >> numberOfExportedSpreadsheetColumns [

	^ 21
]

{ #category : #private }
GameyeCollectionFactory class >> parseExportedSpreadsheetReadStream: aReadStream [
	"Parse a CSV readstream as an array"
	| neoCSVReader array |
	neoCSVReader := NeoCSVReader on: aReadStream.

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

	^array
]
