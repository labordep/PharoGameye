Class {
	#name : #GameyeToyToLifeTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeToyToLifeTest >> testConstructor [

	| toyToLife |
	toyToLife := GameyeCollectible type: GameyeToyToLife type.
	self assert: toyToLife class equals: GameyeToyToLife.
]

{ #category : #tests }
GameyeToyToLifeTest >> testInitialize [

	| toyToLife |
	toyToLife := GameyeToyToLife new.
	self assert: toyToLife type equals: GameyeToyToLife type.
]
