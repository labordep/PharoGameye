Class {
	#name : #GameyeVideoGame,
	#superclass : #GameyeCollectible,
	#instVars : [
		'publisher',
		'developer',
		'playedCompletion',
		'isBeat'
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

{ #category : #accessing }
GameyeVideoGame >> isBeat [

	^ isBeat ifNil:[ isBeat := false ]
]

{ #category : #accessing }
GameyeVideoGame >> isBeat: anObject [

	isBeat := anObject
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
GameyeVideoGame >> playedCompletion [

	^ playedCompletion
]

{ #category : #accessing }
GameyeVideoGame >> playedCompletion: anObject [

	playedCompletion := anObject
]

{ #category : #printing }
GameyeVideoGame >> printIdentifierOn: aStream [

	super printIdentifierOn: aStream.
	(self developer notNil or:[self publisher notNil]) ifFalse:[ ^ self ].
		
	aStream nextPutAll:	' - ';
		nextPutAll: (self developer ifNil:[ '' ] ifNotNil:[ :e | e , ' / ']);
		nextPutAll: (self publisher ifNil:[ '' ])
]

{ #category : #accessing }
GameyeVideoGame >> publisher [

	^ publisher
]

{ #category : #accessing }
GameyeVideoGame >> publisher: anObject [

	publisher := anObject
]
