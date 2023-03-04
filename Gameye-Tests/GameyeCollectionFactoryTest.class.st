"
A GameyeInputDataReaderTest is a test class for testing the behavior of GameyeInputDataReader
"
Class {
	#name : #GameyeCollectionFactoryTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Core'
}

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent [
	"This sample contains some frequently generated cases not easy to read/parse or exceptions due to collection evolution"

	^self exportedSpreadsheetSampleHeadContent, '
"SNES","?",1,0,0,"Super Scope 6 [Gun Bundle]","Missing Field","Missing Field","13/09/2021","Boxed","-1.0", "-1.0", "-1.0", "-1.0","55.97","10","?","9"," "," ","This is a commentary"'
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible [

	^self exportedSpreadsheetSampleHeadContent, '
"SNES","?",1,0,0,"Super Scope 6 [Gun Bundle]","Missing Field","Missing Field","13/09/2021","Boxed","-1.0", "-1.0", "-1.0", "-1.0","55.97","10","?","9"," "," ","This is a commentary"'
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFileReference [
	<script:'self exportedSpreadsheetSampleFileReference inspect'>

	^self exportedSpreadsheetSampleFileReference: '2_20_2023_ge_collection' content: self exportedSpreadsheetSampleContent
]

{ #category : #utils }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFileReference: aFileName content: aString [
	
	| system file |
	system := FileSystem memory workingDirectory.
	file := system / (aFileName asString, 'csv').
	file writeStreamDo: [ :stream | stream nextPutAll: aString asString ].
	^file
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleHeadContent [
	"This sample contains columns head"

	^'Platform,Type,Owned,ForSale,Wishlist,Title,Publisher,Developer,DateAdded,Ownership,PriceLoose,PriceCIB,PriceNew,YourPrice,PricePaid,ItemCondition,BoxCondition,ManualCondition,Beat,PlayedCompletion,Notes'
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1PeripheralAsAUnknownCollectible [

	| collection |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class 
		exportedSpreadsheetSampleFileReference: '2_20_2023_ge_collection' 
		content: self class exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible).
	
	self assert: collection haveUnknowns.
	self assert: collection numberOfCollectibles equals: 1.
]
