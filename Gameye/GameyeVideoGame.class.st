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
