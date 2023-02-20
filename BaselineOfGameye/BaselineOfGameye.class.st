Class {
	#name : #BaselineOfGameye,
	#superclass : #BaselineOf,
	#category : #BaselineOfGameye
}

{ #category : #baselines }
BaselineOfGameye >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			self dependencies: spec.
			
			"Packages"
			spec
				package: 'Gameye';
				package: 'Gameye-Tests' with: [ spec requires: #('Gameye') ];
				package: 'Gameye-Examples' with: [ spec requires: #('Gameye') ].
		]

]

{ #category : #baselines }
BaselineOfGameye >> dependencies: spec [

	"NeoCSV to read CSV exported files"
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
]
