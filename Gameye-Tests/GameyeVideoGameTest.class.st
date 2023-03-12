Class {
	#name : #GameyeVideoGameTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeVideoGameTest >> testConstructor [

	| videoGame |
	videoGame := GameyeCollectible type: GameyeVideoGame type.
	self assert: videoGame class equals: GameyeVideoGame
]

{ #category : #tests }
GameyeVideoGameTest >> testDeveloper [

	| videoGame |
	videoGame := GameyeVideoGame new.
	videoGame developer: 'Nintendo'.
	self assert: videoGame developer equals: 'Nintendo'
]

{ #category : #tests }
GameyeVideoGameTest >> testHaveBox [

	| videoGame |
	videoGame := GameyeVideoGame new.

	videoGame ownership: GameyeOwnership digital.
	self assert: videoGame haveBox equals: false
]

{ #category : #tests }
GameyeVideoGameTest >> testHaveGame [

	| videoGame |
	videoGame := GameyeVideoGame new.

	"True cases"
	videoGame ownership: GameyeOwnership loose.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership loosePlus.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership boxed.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership boxedPlus.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership completeInBox.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership completeInBoxPlus.
	self assert: videoGame haveGame equals: true.

	videoGame ownership: GameyeOwnership sealed.
	self assert: videoGame haveGame equals: true.

	"False cases"
	videoGame ownership: GameyeOwnership manual.
	self assert: videoGame haveGame equals: false.

	videoGame ownership: GameyeOwnership manualAndBox.
	self assert: videoGame haveGame equals: false.

	videoGame ownership: GameyeOwnership other.
	self assert: videoGame haveGame equals: false
]

{ #category : #tests }
GameyeVideoGameTest >> testHaveManual [

	| videoGame |
	videoGame := GameyeVideoGame new.

	videoGame ownership: GameyeOwnership digital.
	self assert: videoGame haveManual equals: false
]

{ #category : #tests }
GameyeVideoGameTest >> testInitialize [

	| videoGame |
	videoGame := GameyeVideoGame new.
	self assert: videoGame type equals: GameyeVideoGame type.
	self assert: videoGame publisher isNil.
	self assert: videoGame developer isNil.

	"Ownership"
	self assert: videoGame haveGame equals: false.
	self assert: videoGame isDigital equals: false
]

{ #category : #tests }
GameyeVideoGameTest >> testIsDigital [

	| videoGame |
	videoGame := GameyeVideoGame new.
	videoGame ownership: GameyeOwnership digital.
	self assert: videoGame isDigital
]

{ #category : #tests }
GameyeVideoGameTest >> testPublisher [

	| videoGame |
	videoGame := GameyeVideoGame new.
	videoGame publisher: 'Nintendo'.
	self assert: videoGame publisher equals: 'Nintendo'
]
