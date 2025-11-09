Class {
	#name : 'GameyeToyToLife',
	#superclass : 'GameyeCollectible',
	#category : 'Gameye-Model',
	#package : 'Gameye',
	#tag : 'Model'
}

{ #category : 'accessing' }
GameyeToyToLife class >> type [

	^ #ToysToLife
]

{ #category : 'testing' }
GameyeToyToLife >> isToyToLife [

	^ true
]
