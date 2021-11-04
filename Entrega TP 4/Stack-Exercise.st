!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:35:14'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:39:45'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:40:25'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:41:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:41:54'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:42:06'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:43:34'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:44:15'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:48:01'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:48:54'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'Stack prefix sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
!SentenceFinderByPrefixTest commentStamp: 'FR 11/2/2021 20:47:36' prior: 0!
setUp

nuevoStack := OOStack new.

nuevoStack push: 'Esta va a ser la primer frase'.

nuevoStack push: 'esta va a ser la segunda frase'.

nuevoStack push: 'estas frases son mas'.

nuevoStack push: 'Esta tiene que aparecer'.

nuevoStack push: 'Estas tiene que aparecer a pesar de la S extra'.

nuevoStack push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

prefix := 'esta'.!


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/3/2021 20:36:00'!
CrearStackPrueba

|StackNuevo|

StackNuevo := OOStack new.

StackNuevo push: 'Esta va a ser la primer frase'.

StackNuevo push: 'esta va a ser la segunda frase'.

StackNuevo push: 'estas frases son mas'.

StackNuevo push: 'Esta tiene que aparecer'.

StackNuevo push: 'Estas tiene que aparecer a pesar de la S extra'.

StackNuevo push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

^StackNuevo! !

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/3/2021 20:34:29'!
setUp

Stack := self CrearStackPrueba.

sentenceFinder := SentenceFinderByPrefix new.

prefix := 'Esta'.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test01SeEncuentraUnaOraciónConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: Stack) size > 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test02SeEncuentraLaCantidadDeOracionesConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: Stack) size equals: 4.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test03SeDevuelvenTodasLasFrasesCorrespondientes
	
	| resultadoCorrecto |
	
	resultadoCorrecto := OrderedCollection new.
	
	resultadoCorrecto add: 'Esta va a ser la primer frase'. 
	resultadoCorrecto add: 'Esta tiene que aparecer'.
	resultadoCorrecto add: 'Estas tiene que aparecer a pesar de la S extra'.
	resultadoCorrecto add: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.	
	
	self assert: (	sentenceFinder find: prefix in: Stack) equals: resultadoCorrecto! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 20:37:18'!
test04ElStackQuedaIgualDespuesDeBuscar
	
	| stackOriginal |
	
	stackOriginal := self CrearStackPrueba.
	
	sentenceFinder find: prefix in: Stack.
		
	1 to: Stack size do: [:x | self assert: Stack top = stackOriginal top.
	Stack pop.
	stackOriginal pop.]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 22:22:08'!
test05ElPrefijoNoPuedeContenerEspacios
	
	self 
		should: [sentenceFinder  find: 'Esta ' in: Stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 22:22:12'!
test06ElPrefijoNoPuedeSerNil
	
	self 
		should: [sentenceFinder find: nil in: Stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 22:22:17'!
test07ElPrefijoNoPuedeEstarVacío
	
	self 
		should: [sentenceFinder find: '' in: Stack ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:24:25'!
changeTopTo: aContainer

	top := aContainer! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:24:55'!
initialize

	top := NullContainer new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:27:00'!
isEmpty

	^top isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:32:52'!
pop

	^top removeTopContainerFrom: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:49'!
push: anObject

	top addContainerWith: anObject to: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:24:47'!
size

	^top sizeCounter: 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:29:16'!
top

	^top getContent! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'FR 11/1/2021 14:27:09'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:21:42'!
find: aPrefix in: aStack
	
	|result|
	
	result := OrderedCollection new.
	
	(aPrefix isKindOf: String) ifFalse: [^self error: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces].
	
	(aPrefix isEmpty) | (aPrefix includesSubString:  ' ') ifTrue: [^self error: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces].
	
	1 to: (aStack size) do: [:x | result addFirst: aStack pop].
	1 to: (result size) do: [:position | aStack push: (result at: position)].	
	
	^result select: [:aString | aString beginsWith: aPrefix].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:21:42'!
PrefixCantBeNilOrContainSpaces

	^'The prefix cannot be nill nor contain spaces'.! !


!classDefinition: #StackContainer category: 'Stack-Exercise'!
Object subclass: #StackContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:40:51'!
addContainerWith: anObject to: aStack

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:29:16'!
getContent

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:15:17'!
initializeWith: anObject and: aContainer

	^self subclassResponsibility ! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:50'!
isEmpty

	^self subclassResponsibility! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:32:51'!
removeTopContainerFrom: aStack

	^self subclassResponsibility ! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:49:50'!
sizeCounter: aStackSize
	^self subclassResponsibility.! !


!classDefinition: #FilledContainer category: 'Stack-Exercise'!
StackContainer subclass: #FilledContainer
	instanceVariableNames: 'previousContainer content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:47:18'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (FilledContainer with: anObject and: self).! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:29:16'!
getContent

	^content! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:39:59'!
initializeWith: anObject and: aContainer

	previousContainer := aContainer.
	content := anObject! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:33:39'!
isEmpty

	^false! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:32:51'!
removeTopContainerFrom: aStack

	aStack changeTopTo: previousContainer.
	
	^content.! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:39:02'!
sizeCounter: parcialStackSize
	
	^previousContainer sizeCounter: parcialStackSize + 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledContainer class' category: 'Stack-Exercise'!
FilledContainer class
	instanceVariableNames: ''!

!FilledContainer class methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:48:11'!
with: anObject and: aContainer

	^self new initializeWith: anObject  and: aContainer.! !


!classDefinition: #NullContainer category: 'Stack-Exercise'!
StackContainer subclass: #NullContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:47:24'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (FilledContainer with: anObject and: self).! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:29:16'!
getContent

	^self error: OOStack stackEmptyErrorDescription ! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:12'!
isEmpty

	^true! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:32:52'!
removeTopContainerFrom: aStack

	^self error: OOStack stackEmptyErrorDescription.! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 22:37:15'!
sizeCounter: stackSize
	
	^stackSize! !
