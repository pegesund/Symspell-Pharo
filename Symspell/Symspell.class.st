Class {
	#name : 'Symspell',
	#superclass : 'Object',
	#instVars : [
		'maxEditDistance',
		'dictionary',
		'deletesDictionary',
		'longestWordLength'
	],
	#category : 'Symspell',
	#package : 'Symspell'
}

{ #category : 'adding' }
Symspell >> addWordToDictionary: aWord [
    dictionary at: aWord put: (dictionary at: aWord ifAbsent: 0) + 1.
    longestWordLength := longestWordLength max: aWord size
]

{ #category : 'private' }
Symspell >> calculateRank: distance with: frequency [
    ^ (1.0 / (distance + 1) squared) * (frequency log)
]

{ #category : 'suggestions' }
Symspell >> correct: aString [
    | suggestions |
    (dictionary includesKey: aString) ifTrue: [ ^ aString ].
    
    suggestions := self getSuggestions: aString.
    suggestions isEmpty ifTrue: [ ^ aString ].
    ^ suggestions first key
]

{ #category : 'private' }
Symspell >> editDistance: s1 with: s2 [
    | distances newDistances |
    s1 size > s2 size ifTrue: [ ^ self editDistance: s2 with: s1 ].
    distances := (0 to: s1 size) asArray.
    s2 withIndexDo: [ :char2 :index2 |
        newDistances := OrderedCollection with: index2.
        s1 withIndexDo: [ :char1 :index1 |
            char1 = char2
                ifTrue: [ newDistances add: (distances at: index1) ]
                ifFalse: [
                    newDistances add: (1 + (((distances at: index1) min: (distances at: index1 + 1)) min: newDistances last))
                ]
        ].
        distances := newDistances asArray
    ].
    ^ distances last
]

{ #category : 'private' }
Symspell >> generateDeletes: aWord [
    | deletes queue tempQueue delete |
    deletes := Set new.
    queue := OrderedCollection with: aWord.
    1 to: maxEditDistance do: [ :distance |
        tempQueue := OrderedCollection new.
        queue do: [ :word |
            word size > 1 ifTrue: [
                1 to: word size do: [ :i |
                    delete := (word first: i - 1) , (word allButFirst: i).
                    (deletes includes: delete) ifFalse: [
                        deletes add: delete.
                        tempQueue add: delete.
                        (deletesDictionary at: delete ifAbsentPut: [OrderedCollection new]) add: aWord
                    ]
                ]
            ]
        ].
        queue := tempQueue
    ].
    ^ deletes
]

{ #category : 'private' }
Symspell >> getCandidates: aString [
    | candidates deletes |
    candidates := Set new.
    candidates add: aString.
    deletes := self generateDeletes: aString.
    deletes do: [ :delete |
        (deletesDictionary at: delete ifAbsent: [OrderedCollection new]) do: [ :candidate |
            candidates add: candidate
        ]
    ].
    ^ candidates
]

{ #category : 'private' }
Symspell >> getSuggestions: aString [
    | suggestions candidates |
    suggestions := Dictionary new.
    candidates := self getCandidates: aString.
    
    candidates do: [ :candidate |
        (dictionary includesKey: candidate) ifTrue: [
            | distance |
            distance := self editDistance: aString with: candidate.
            distance <= maxEditDistance ifTrue: [
                suggestions at: candidate put: (Array with: distance with: (dictionary at: candidate))
            ]
        ]
    ].
    
    ^ suggestions associations sorted: [ :a :b | 
        | rankA rankB |
        rankA := self calculateRank: a value first with: a value second.
        rankB := self calculateRank: b value first with: b value second.
        rankA > rankB
    ]
]

{ #category : 'initialization' }
Symspell >> initialize [
    super initialize.
    maxEditDistance := 2.
    dictionary := Dictionary new.
    deletesDictionary := Dictionary new.
    longestWordLength := 0
]

{ #category : 'initialization' }
Symspell >> loadDictionary: aString [
    | words |
    words := aString asLowercase substrings.
    words do: [ :word |
        self addWordToDictionary: word.
        self generateDeletes: word
    ].
]

{ #category : 'private' }
Symspell >> topSuggestionsFor: aString [
    | suggestions |
    suggestions := self getSuggestions: aString.
    ^ suggestions first: (5 min: suggestions size)
]
