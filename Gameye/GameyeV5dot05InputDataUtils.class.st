Class {
	#name : 'GameyeV5dot05InputDataUtils',
	#superclass : 'GameyeV5InputDataUtils',
	#category : 'Gameye-Core',
	#package : 'Gameye',
	#tag : 'Core'
}

{ #category : 'parsing' }
GameyeV5dot05InputDataUtils class >> createCollectibleFromDataArray: anArray [
	| collectible userRecordType tags |

	anArray ifNil: [ ^ nil ].
	anArray size = self numberOfExportedSpreadsheetColumns ifFalse:[ ^ nil ].

	"Create the collectible"
	collectible := GameyeCollectible type: (anArray at: 2).
	collectible platform: (anArray at: 1).
	userRecordType := anArray at: 3.
	collectible isOwned: (userRecordType = #Owned).
	collectible isForSale: (userRecordType = #ForSale).
	collectible isOnWishList: (userRecordType = #Wishlist).
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
	collectible notes: (anArray at: 19).
	
	tags := self extractTagsFromCell: (anArray at: 20).
	tags ifNotNil:[collectible tags addAll: tags].

	"Processing for Video Games"
	collectible isVideoGame ifTrue:[
		collectible publisher: (anArray at: 7).
		collectible developer: (anArray at: 8).
	].

	"Processing for unknown collectible : conserve original datas to have a post analyse"
	collectible isUnknown ifTrue:[collectible rawDatas: anArray].

	^ collectible
]

{ #category : 'accessing' }
GameyeV5dot05InputDataUtils class >> numberOfExportedSpreadsheetColumns [

	^ 20
]

{ #category : 'parsing' }
GameyeV5dot05InputDataUtils class >> parseExportedSpreadsheetReadStream: aReadStream [
	"Parse a CSV readstream as an Array"
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
		addFieldConverter: [ :string | Date readFromDMonYYYYPattern: string ]; "CreatedAt"
		addSymbolField; "Ownership"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceLoose"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceCIB"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PriceNew"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "YourPrice"
		addFieldConverter: [ :string | self parseNeoNumberString: string ]; "PricePaid"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "ItemCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "BoxCondition"
		addFieldConverter: [ :string | NeoNumberParser parse: string ifFail: [nil] ]; "ManualCondition"
		addField; "Notes"
		addField; "Tags"
		upToEnd.

	^ array
]
