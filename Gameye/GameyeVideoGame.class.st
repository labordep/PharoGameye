Class {
	#name : #GameyeVideoGame,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeVideoGame class >> type [

	^ #VideoGame
]

{ #category : #testing }
GameyeVideoGame >> isVideoGame [ 

	^ true
]
