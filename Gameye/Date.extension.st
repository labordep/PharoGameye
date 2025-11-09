Extension { #name : 'Date' }

{ #category : '*Gameye' }
Date class >> readFromDMonYYYYPattern: aStringOrStream [
	"Read '5 Jul 2025' pattern"

	| dmy stream |

	"separate string to find each values of the date"
	dmy := aStringOrStream splitOn: Character space.
	dmy size ~= 3 ifTrue:[ DateError signal ].

	"day"
	stream := ReadWriteStream with: (dmy at: 1). 
	stream ensureASpace.
	"month"
	stream nextPutAll: ((Month month: (dmy at: 2)) index asString); ensureASpace.
	"year"
	stream nextPutAll: (dmy at: 3).

	^ self readFrom: stream contents pattern: 'd m yyyy'
]
