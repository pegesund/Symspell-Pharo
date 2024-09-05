Class {
	#name : 'SymspellTest',
	#superclass : 'TestCase',
	#category : 'Symspell-Tests',
	#package : 'Symspell-Tests'
}

{ #category : 'tests' }
SymspellTest >> testSymspell [
| res symSpell corpus testWords |
symSpell := Symspell new.
corpus := 'the quick brown fox jumps over the lazy dog fixes'.
symSpell loadDictionary: corpus.
testWords := #('quik' 'foks' 'doog' 'brwn' 'lazyy' 'fikses').
res := testWords collect: [ :w | symSpell correct: w ].
self assert: res equals: #('quick' 'fox' 'dog' 'brown' 'lazy' 'fixes').
]
