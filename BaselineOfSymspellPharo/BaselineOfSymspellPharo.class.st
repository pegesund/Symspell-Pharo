Class {
	#name : 'BaselineOfSymspellPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspellPharo',
	#package : 'BaselineOfSymspellPharo'
}

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baseline: spec [
	<baseline>

	spec for: #pharo do: [
		spec package: 'Symspell'.
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell' ) ].
		spec group: 'default' with: #( 'Symspell' ) ]
]

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baselineOf: spec [
	<baseline>

	spec for: #pharo do: [
		spec package: 'Symspell'.
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell' ) ].
		spec group: 'default' with: #( 'Symspell' ) ]
]
