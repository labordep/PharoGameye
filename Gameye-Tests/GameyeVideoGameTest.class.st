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
GameyeVideoGameTest >> testInitialize [

	| videoGame |
	videoGame := GameyeVideoGame new.
	self assert: videoGame type equals: GameyeVideoGame type.
	self assert: videoGame publisher isNil.
	self assert: videoGame developer isNil
]

{ #category : #tests }
GameyeVideoGameTest >> testPublisher [

	| videoGame |
	videoGame := GameyeVideoGame new.
	videoGame publisher: 'Nintendo'.
	self assert: videoGame publisher equals: 'Nintendo'
]
