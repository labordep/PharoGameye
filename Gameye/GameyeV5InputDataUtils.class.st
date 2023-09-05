Class {
	#name : #GameyeV5InputDataUtils,
	#superclass : #AbstractGameyeInputDataUtils,
	#category : #'Gameye-Core'
}

{ #category : #parsing }
GameyeV5InputDataUtils class >> createCollectibleFromDataArray: anArray [
	| collectible userRecordType |

	anArray ifNil: [ ^ nil ].
	anArray size = self numberOfExportedSpreadsheetColumns ifFalse:[ ^ nil ].

	"Create the collectible"
	collectible := GameyeCollectible type: (anArray at: 2).
	collectible platform: (anArray at: 1).
	userRecordType := anArray at: 3.
	collectible isOwned: (userRecordType = #Owned).
	collectible isForSale: (userRecordType = #ForSale).
	collectible isOnWishList: (userRecordType = #Wishlist). self flag:'labordep: check if this is the correct symbol'.
	collectible title: (anArray at: 4).
	collectible country: (anArray at: 5).
	collectible releaseType: (anArray at: 6).
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
	collectible tags: (anArray at: 22).

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

{ #category : #accessing }
GameyeV5InputDataUtils class >> exportedSpreadsheetGameAccessorieType [

	^ '"Game Accessories"'
]

{ #category : #accessing }
GameyeV5InputDataUtils class >> exportedSpreadsheetToyToLifeType [

	^ '"Toys To Life"'
]

{ #category : #accessing }
GameyeV5InputDataUtils class >> exportedSpreadsheetVideoGameType [

	^ '"Games"'
]

{ #category : #accessing }
GameyeV5InputDataUtils class >> extractCellsFromLine: aString [
	| cells newCells safeCells type |

	cells := aString substrings: ','.
	cells size = self numberOfExportedSpreadsheetColumns ifTrue:[ ^ cells asArray ].

	"Recreate cells from 1 to 3 (no problematic cells)"
	newCells := OrderedCollection new.
	safeCells := newCells copy asArray.
	1 to: 3 do:[ :i | newCells add: (cells at: i) ].

	"Not found case : why this case can be possible ?"
	cells size > self numberOfExportedSpreadsheetColumns ifFalse:[ ^ safeCells ].

	"Processing for Games or Systems"
	type := cells at: 2.
	(type = self exportedSpreadsheetVideoGameType or:[type = self exportedSpreadsheetSystemType or:[type = self exportedSpreadsheetPeripheralType]]) ifTrue:[ | rebuildedCells |

		"A comma or more are inside datas, probably inside string datas as title or editor name or comment (etc.).
		Try to cut manually and format the comma into HTML code &#44; to ignor the comma during parsing"

		"Problematic cells zone : 4 to 22, extract all cells of the array to rebuild the correct number of cell"
		rebuildedCells := self rebuildCells: (cells copyFrom: 4 to: cells size).
		newCells addAll: rebuildedCells.
	].

	newCells size ~= self numberOfExportedSpreadsheetColumns ifTrue:[
		"Not found case : why this case can be possible ?"
		^ safeCells
	].

	^newCells asArray
]

{ #category : #accessing }
GameyeV5InputDataUtils class >> gameyeVersion [ 

	^ GameyeVersion v5
]

{ #category : #parsing }
GameyeV5InputDataUtils class >> getSpreadsheetReadStream: aFileReference [
	"Return a ReadStream of an exported SpreadSheet file with fixing all knowns generation knowns problems"
	| readStream line fixedStream |
	
	readStream := aFileReference readStream.
	line := readStream nextLine.
	
	"Build the new stream"
	fixedStream := ReadWriteStream on: String new.
	fixedStream nextPutAll: line; cr.
	
	line := readStream nextLine.

	[ line notNil ] whileTrue:[  | cells columnId |
		cells := self extractCellsFromLine: line.
		columnId := 1.
		"Cell content processing"
		cells do:[ :cell | | formattedCell |

			"Specific type formatting"
			columnId = 2 ifTrue:[
				self flag:'labordep: check if printed media call have same name in v4 and v5'.
				cell = self exportedSpreadsheetPrintMediaType ifTrue:[formattedCell := '"PrintMedia"'].
				cell = self exportedSpreadsheetGameAccessorieType ifTrue:[formattedCell := '"GameAccessories"'].
				cell = self exportedSpreadsheetToyToLifeType ifTrue:[formattedCell := '"ToysToLife"'].
				cell = self exportedSpreadsheetVideoGameType ifTrue:[formattedCell := '"VideoGame"'].
			].
		
			formattedCell ifNil:[
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

		line := readStream nextLine.
	].

	readStream close.
	^ fixedStream reset
]

{ #category : #accessing }
GameyeV5InputDataUtils class >> numberOfExportedSpreadsheetColumns [

	^ 22
]

{ #category : #parsing }
GameyeV5InputDataUtils class >> parseExportedSpreadsheetReadStream: aReadStream [
	"Parse a CSV readstream as an array"
	| neoCSVReader array |
	neoCSVReader := NeoCSVReader on: aReadStream.
	
	array := neoCSVReader
		separator: $,;
		skipHeader;
		addField; "Platform"
		addSymbolField; "Category (= Type)"
		addSymbolField; "UserRecordType"
		addFieldConverter: [ :string | string = 'Missing Field' ifTrue:[nil] ifFalse:[string] ]; "Title"
		addSymbolField; "Country"
		addSymbolField; "Release type"
		addFieldConverter: [ :string | string = 'Missing Field' ifTrue:[nil] ifFalse:[string] ]; "Publisher"
		addFieldConverter: [ :string | string = 'Missing Field' ifTrue:[nil] ifFalse:[string] ]; "Developer"
		addFieldConverter: [ :string | Date readFrom: string pattern: 'dd/mm/yyyy' ]; "CreatedAt"
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
		addField; "Tags"
		upToEnd.

	^array
]

{ #category : #'see class side' }
GameyeV5InputDataUtils >> seeClassSide [
]
