Class {
	#name : #GameyeVideoGame,
	#superclass : #GameyeCollectible,
	#instVars : [
		'publisher',
		'developer'
	],
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeVideoGame class >> type [

	^ #VideoGame
]

{ #category : #accessing }
GameyeVideoGame >> developer [

	^ developer
]

{ #category : #accessing }
GameyeVideoGame >> developer: anObject [

	developer := anObject
]

{ #category : #'testing - ownership' }
GameyeVideoGame >> haveBox [

	self isDigital ifTrue: [ ^ false ].
	^ super haveBox
]

{ #category : #'testing - ownership' }
GameyeVideoGame >> haveGame [

	^self isLoose or:[self isLoosePlus or:[self isBoxed or:[self isBoxedPlus or:[self isCIB or:[self isCIBPlus or:[self isDigital or:[self isSealed ]]]]]]]
]

{ #category : #'testing - ownership' }
GameyeVideoGame >> haveManual [

	self isDigital ifTrue: [ ^ false ].
	^ super haveManual
]

{ #category : #'testing - ownership' }
GameyeVideoGame >> isDigital [

	^ self ownership = GameyeOwnership digital
]

{ #category : #testing }
GameyeVideoGame >> isVideoGame [

	^ true
]

{ #category : #accessing }
GameyeVideoGame >> publisher [

	^ publisher
]

{ #category : #accessing }
GameyeVideoGame >> publisher: anObject [

	publisher := anObject
]
