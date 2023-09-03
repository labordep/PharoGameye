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
GameyeCollectionFactory class >> createCollectibleFromDataArray: anArray [
	| collectible |

	anArray ifNil: [ ^ nil ].
	anArray size = GameyeInputDataUtils numberOfExportedSpreadsheetColumns ifFalse:[ ^ nil ].

	"Create the collectible"
	collectible := GameyeCollectible type: (anArray at: 2).
	collectible platform: (anArray at: 1).
	collectible isOwned: (anArray at: 3).
	collectible isForSale: (anArray at: 4).
	collectible isOnWishList: (anArray at: 5).
	collectible title: (anArray at: 6).
	collectible dateAdded: (anArray at: 9).
	collectible ownership: (anArray at: 10).
	collectible priceLoose: (anArray at: 11).
	collectible priceCIB: (anArray at: 12).
	collectible priceNew: (anArray at: 13).
	collectible yourPrice: (anArray at: 14).
	collectible pricePaid: (anArray at: 15).
	collectible itemCondition: (anArray at: 16).
	collectible boxCondition: (anArray at: 17).
	collectible manualCondition: (anArray at: 18).
	collectible notes: (anArray at: 21).

	"Processing for Video Games"
	collectible isVideoGame ifTrue:[
		collectible publisher: (anArray at: 7).
		collectible developer: (anArray at: 8).
		collectible isBeat: (anArray at: 19).
		collectible playedCompletion: (anArray at: 20).
	].

	"Processing for unknown collectible : conserve original datas to have a post analyse"
	collectible isUnknown ifTrue:[collectible rawDatas: anArray].

	^ collectible
]

{ #category : #private }
GameyeCollectionFactory class >> createCollectionsFromDataArray: anArray [
	"Return collections from array : collectibles, wishlist and for sell"
	| collection collections wishListCollection forSellCollection |

	collections := Dictionary new.
	collection := GameyeCollection new gameyeVersion: GameyeVersion v4; yourself.
	wishListCollection := GameyeCollection new gameyeVersion: GameyeVersion v4; yourself.
	forSellCollection := GameyeCollection new gameyeVersion: GameyeVersion v4; yourself.

	collections at: GameyeCollection owned put: collection.
	collections at: GameyeCollection wish put: wishListCollection.
	collections at: GameyeCollection forSell put: forSellCollection.

	anArray ifNil: [ ^ collections ].
	anArray do:[ :e |
		(self createCollectibleFromDataArray: e) ifNotNil:[ :collectible |
			collectible isForSale ifTrue:[ forSellCollection addCollectible: collectible ] ifFalse:[
				collectible isOnWishList ifTrue:[ wishListCollection addCollectible: collectible ] ifFalse:[
					collection addCollectible: collectible.
				].
			].
		].
	].

	^ collections
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createCollectionsFromExportedSpreadsheet: aFileReference [
	"Return all collections from a file : collectibles, for sell and wish list"
	| readStream array date collections fileName |

	aFileReference ifNil:[ ^ self signalNotAFile ].
	aFileReference isFile ifFalse:[ ^ self signalNotAFile ].

	readStream := GameyeInputDataUtils prepareExportedSpreadsheetReadStream: aFileReference readStream.
	
	array := self parseExportedSpreadsheetReadStream: readStream.
	
	collections := (self createCollectionsFromDataArray: array) ifNil:[ ^ nil ].

	"Check if the date is on the filename and add it to the collection data"
	fileName := aFileReference path basename.
	date := self getDateFromExportedSpreadsheetFilename: fileName.

	fileName := aFileReference path basenameWithoutExtension.
	collections keysAndValuesDo:[ :k :collection | 
		collection name: fileName, (k = GameyeCollection wish ifTrue:['_wish'] ifFalse:[k = GameyeCollection forSell ifTrue:['_forSell'] ifFalse:['']]).
		collection date: date. 
	].
	
	^ collections
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createForSellCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the for seell collection (not collection and wish list collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection forSell
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createOwnedCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the collectibles collection (not for sell and wish list collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection owned
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createWishListCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the wish list collection (not collection and for sell collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection wish
]

{ #category : #private }
GameyeCollectionFactory class >> getDateFromExportedSpreadsheetFilename: aString [

	| a |
	aString ifNil:[ ^ nil ].

	"Check if the date is on the filename and add it to the collection data"
	(('##_##_####_*.csv' match: aString) or:[('#_##_####_*.csv' match: aString) or:[('#_#_####_*.csv' match: aString)]]) ifFalse:[ ^ nil ].

	a := (aString substrings: '_').
	^ Date newDay: (a at: 2) asInteger month: (a at: 1) asInteger year: (a at: 3) asInteger
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
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceLoose"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceCIB"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceNew"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "YourPrice"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PricePaid"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "ItemCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "BoxCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "ManualCondition"
		addField; "Beat"
		addField; "PlayedCompletion"
		addField; "Notes"
		upToEnd.

	self flag:'TODO : Beat as a boolean, played completion as an Integer (%)'.

	^array
]

{ #category : #private }
GameyeCollectionFactory class >> parseNeoNumberString: aString [

	aString = '-1.0' ifTrue:[ ^ nil ].
	aString = '?' ifTrue:[ ^ nil ].

	^ NeoNumberParser parse: aString ifFail: [nil]
]

{ #category : #'error signalling' }
GameyeCollectionFactory class >> signalNotAFile [

	^ NotAFileGameyeError signal
]

{ #category : #'see class side' }
GameyeCollectionFactory >> seeClassSide [
]
