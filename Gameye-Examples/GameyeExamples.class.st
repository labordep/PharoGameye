Class {
	#name : #GameyeExamples,
	#superclass : #Object,
	#category : #'Gameye-Examples'
}

{ #category : #'2 - querying datas' }
GameyeExamples class >> getLast30DaysAddedVideoGamesInOwnedCollection [
	"Return video games added into the owned collection from last 30 days"
	<script>
	| collections collection games systems |
	collections := self loadCollectionsFromExportedSpreadsheet ifNil:[^ self].
	collection := collections at: #owned.
	
	"First : get games from date"
	games := collection videoGamesCollectibles select:[ :c | c dateAdded >= (Date today - 30 days) ].

	"Second : ordered by systems"
	systems := Dictionary new.
	games do:[ :e |
		(systems at: e platform ifAbsentPut:[OrderedCollection new]) add: e.
	].
	
	systems inspect.
]

{ #category : #'1 - importing datas' }
GameyeExamples class >> importAndInspectSpreadsheet [
	<script>
	
	self loadCollectionsFromExportedSpreadsheet inspect.
]

{ #category : #private }
GameyeExamples class >> loadCollectionsFromExportedSpreadsheet [
	"Open a file browser and load a .csv file exported with the application, this example works with Gameye v4.x and v5.x"

	| fileReference |
	"Cannot known to open a native OS file dialog, so use the pharo not very praticle file dialog :("
	fileReference := UIManager default chooseExistingFileReference: nil extensions: #('csv') path: FileSystem workingDirectory.
	fileReference ifNil:[ ^ nil ].

	^ GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: fileReference
]

{ #category : #'2 - querying datas' }
GameyeExamples class >> paidPricesVsMarketPricesForOwnedCollection [
	"Return statistic about the price paid for a collection vs the market price"
	<script>
	| collections collection stream paid market nbNotPaid nbNotMarketed |
	collections := self loadCollectionsFromExportedSpreadsheet ifNil:[^ self].
	collection := collections at: #owned.

	stream := ReadWriteStream with: String new.	
	
	paid := 0.
	nbNotPaid := 0.
	market := 0.
	nbNotMarketed := 0.
	collection collectibles do:[ :e | 
		e pricePaid ifNil: [ nbNotPaid := nbNotPaid +1 ] ifNotNil: [ paid := paid + e pricePaid ]. 
		e yourPrice ifNil: [ nbNotMarketed := nbNotMarketed +1 ] ifNotNil: [ market := market + e yourPrice ]. 
	].
	
	stream 
		nextPutAll: 'Price paid : ';
		nextPutAll: paid rounded asString;
		nextPutAll: ' €$'; 
		cr;
		nextPutAll: 'Market price : ';
		nextPutAll: market rounded asString;
		nextPutAll: ' €$';
		cr;
		nextPutAll: nbNotPaid asString;
		nextPutAll: ' without buy price, ';
		nextPutAll: nbNotMarketed asString;
		nextPutAll: ' without market price, ';
		nextPutAll: collection collectibles size asString;
		nextPutAll: ' total collectibles.'.
	
	stream contents inspect.
]

{ #category : #'see class side' }
GameyeExamples >> seeClassSide [
]
