"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestSymspell',
	#superclass : 'PackageManifest',
	#category : 'Symspell-Manifest',
	#package : 'Symspell',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestSymspell class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Symspell #generateDeletes: #false)) #'2024-09-05T14:52:47.286766+02:00') )
]
