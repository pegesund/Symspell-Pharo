Class {
	#name : 'BaselineOfSymspellPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspellPharo',
	#package : 'BaselineOfSymspellPharo'
}

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baselineOf: spec [

	spec for: #pharo do: [
		spec package: 'Symspell'.
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell'  ) ].
		spec group: 'default' with: #( 'Symspell'  ) ]
]
