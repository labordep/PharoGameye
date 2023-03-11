Class {
	#name : #GameyeVideoGameTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeVideoGameTest >> testConstructor [

	| videoGame |
	videoGame := GameyeCollectible type: GameyeVideoGame type.
	self assert: videoGame class equals: GameyeVideoGame.
]

{ #category : #tests }
GameyeVideoGameTest >> testInitialize [

	| videoGame |
	videoGame := GameyeVideoGame new.
	self assert: videoGame type equals: GameyeVideoGame type.
]
