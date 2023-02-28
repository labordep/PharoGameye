Class {
	#name : #GameyeVideoGame,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #testing }
GameyeVideoGame class >> isVideoGame [ 

	^ true
]

{ #category : #accessing }
GameyeVideoGame class >> type [

	^ #VideoGame
]
