!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:32:00'!
test01LimitedSizeStackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack with: 5.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:31:28'!
test02PushAddElementsToTheLimitedSizeStack

	| stack |
	
	stack := OOStack with: 5.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:31:37'!
test03PopRemovesElementsFromTheLimitedSizeStack

	| stack |
	
	stack := OOStack with: 5.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:31:06'!
test04PopReturnsLastPushedObjectForLSS

	| stack pushedObject |
	
	stack := OOStack with: 5.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:30:55'!
test05LimitedSizeStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack with:5.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:30:41'!
test06TopReturnsLastPushedObjectForLSS

	| stack pushedObject |
	
	stack := OOStack with: 5.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:30:34'!
test07TopDoesNotRemoveObjectFromLSStack

	| stack pushedObject |
	
	stack := OOStack with: 5.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:30:18'!
test08CanNotPopWhenThereAreNoObjectsInTheLSStack

	| stack  |
	
	stack := OOStack with: 5.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:29:54'!
test09CanNotPopWhenThereAreNoObjectsInTheLSStackAndTheLSStackHadObjects

	| stack  |
	
	stack := OOStack with: 5.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:29:31'!
test10CanNotTopWhenThereAreNoObjectsInTheLSStack

	| stack  |
	
	stack := OOStack with: 5.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:29:25'!
test11CanPushItemsIfTheLSStackIsNotFull

	| stack  |
	
	stack := OOStack with: 5.

	1 to: 5 do: [:aNumber | stack push: 'aNumber'].
	
	self assert: stack size equals: 5.! !

!OOStackTest methodsFor: 'testsForFixedSizedStack' stamp: 'FR 11/4/2021 17:29:13'!
test12CantPushItemsIfTheLSStackIsFull

	| stack  |
	
	stack := OOStack with: 5.

	self 
		should: [1 to: 6 do: [:aNumber | stack push: 'aNumber']]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: LimitedSizeStack stackCannotAddContainersIfMaxSizeIsReached]! !


!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/4/2021 17:10:35'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:39:45'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:40:25'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:41:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:41:54'!
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

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:42:06'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/1/2021 14:43:34'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/4/2021 17:17:18'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/4/2021 17:17:24'!
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

!OOStackTest methodsFor: 'testForInfiniteStack' stamp: 'FR 11/4/2021 17:18:50'!
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
	instanceVariableNames: 'StackIlimitado StackLimitado prefix sentenceFinder'
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


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/4/2021 17:35:24'!
CrearStackIlimitadoPrueba

|StackNuevo|

StackNuevo := OOStack new.

StackNuevo push: 'Esta va a ser la primer frase'.

StackNuevo push: 'esta va a ser la segunda frase'.

StackNuevo push: 'estas frases son mas'.

StackNuevo push: 'Esta tiene que aparecer'.

StackNuevo push: 'Estas tiene que aparecer a pesar de la S extra'.

StackNuevo push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

^StackNuevo! !

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/4/2021 17:38:32'!
CrearStackLimitadoPrueba

|StackNuevo|

StackNuevo := OOStack with: 6.

StackNuevo push: 'Esta va a ser la primer frase'.

StackNuevo push: 'esta va a ser la segunda frase'.

StackNuevo push: 'estas frases son mas'.

StackNuevo push: 'Esta tiene que aparecer'.

StackNuevo push: 'Estas tiene que aparecer a pesar de la S extra'.

StackNuevo push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

^StackNuevo! !

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/4/2021 17:36:26'!
setUp

StackIlimitado := self CrearStackIlimitadoPrueba.

StackLimitado := self CrearStackIlimitadoPrueba.

sentenceFinder := SentenceFinderByPrefix new.

prefix := 'Esta'.! !


!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:36:56'!
test01SeEncuentraUnaOraciónConElPrefijoEnStackLimitado
	
	self assert: (	sentenceFinder find: prefix in: StackLimitado) size > 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:37:01'!
test02SeEncuentraLaCantidadDeOracionesConElPrefijoEnStackLimitado
	
	self assert: (	sentenceFinder find: prefix in: StackLimitado) size equals: 4.! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:37:06'!
test03SeDevuelvenTodasLasFrasesCorrespondientesEnStackLimitado
	
	| resultadoCorrecto |
	
	resultadoCorrecto := OrderedCollection new.
	
	resultadoCorrecto add: 'Esta va a ser la primer frase'. 
	resultadoCorrecto add: 'Esta tiene que aparecer'.
	resultadoCorrecto add: 'Estas tiene que aparecer a pesar de la S extra'.
	resultadoCorrecto add: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.	
	
	self assert: (	sentenceFinder find: prefix in: StackLimitado) equals: resultadoCorrecto! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:38:32'!
test04ElStackQuedaIgualDespuesDeBuscarEnStackLimitado
	
	| stackOriginal |
	
	stackOriginal := self CrearStackLimitadoPrueba.
	
	sentenceFinder find: prefix in: StackLimitado.
		
	1 to: StackLimitado size do: [:x | self assert: StackLimitado top = stackOriginal top.
	StackLimitado pop.
	stackOriginal pop.]! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:38:04'!
test05ElPrefijoNoPuedeContenerEspaciosEnStackLimitado
	
	self 
		should: [sentenceFinder  find: 'Esta ' in: StackLimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:38:09'!
test06ElPrefijoNoPuedeSerNilEnStackLimitado
	
	self 
		should: [sentenceFinder find: nil in: StackLimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testParaStackLimitado' stamp: 'FR 11/4/2021 17:38:12'!
test07ElPrefijoNoPuedeEstarVacíoEnStackLimitado
	
	self 
		should: [sentenceFinder find: '' in: StackLimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !


!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test01SeEncuentraUnaOraciónConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: StackIlimitado) size > 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test02SeEncuentraLaCantidadDeOracionesConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: StackIlimitado) size equals: 4.! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test03SeDevuelvenTodasLasFrasesCorrespondientes
	
	| resultadoCorrecto |
	
	resultadoCorrecto := OrderedCollection new.
	
	resultadoCorrecto add: 'Esta va a ser la primer frase'. 
	resultadoCorrecto add: 'Esta tiene que aparecer'.
	resultadoCorrecto add: 'Estas tiene que aparecer a pesar de la S extra'.
	resultadoCorrecto add: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.	
	
	self assert: (	sentenceFinder find: prefix in: StackIlimitado) equals: resultadoCorrecto! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test04ElStackQuedaIgualDespuesDeBuscar
	
	| stackOriginal |
	
	stackOriginal := self CrearStackIlimitadoPrueba.
	
	sentenceFinder find: prefix in: StackIlimitado.
		
	1 to: StackIlimitado size do: [:x | self assert: StackIlimitado top = stackOriginal top.
	StackIlimitado pop.
	stackOriginal pop.]! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test05ElPrefijoNoPuedeContenerEspacios
	
	self 
		should: [sentenceFinder  find: 'Esta ' in: StackIlimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test06ElPrefijoNoPuedeSerNil
	
	self 
		should: [sentenceFinder find: nil in: StackIlimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !

!SentenceFinderByPrefixTest methodsFor: 'testsParaStackIlimitado' stamp: 'FR 11/4/2021 17:36:12'!
test07ElPrefijoNoPuedeEstarVacío
	
	self 
		should: [sentenceFinder find: '' in: StackIlimitado ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: SentenceFinderByPrefix PrefixCantBeNilOrContainSpaces]! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:48:03'!
changeTopTo: aContainer

	^self subclassResponsibility ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:28:38'!
initialize

	^UnlimitedSizeStack new! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:48:26'!
isEmpty

	^self subclassResponsibility ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:48:36'!
pop

	^self subclassResponsibility ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:49:19'!
push: anObject

	^self subclassResponsibility ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:52:14'!
size

	^self subclassResponsibility ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:52:32'!
top

	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'FR 11/1/2021 14:27:09'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:28:25'!
with: aSize

	^LimitedSizeStack new withFixedSize: aSize! !


!classDefinition: #LimitedSizeStack category: 'Stack-Exercise'!
OOStack subclass: #LimitedSizeStack
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:14'!
changeTopTo: aContainer

	top := aContainer! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:27'!
initialize

	top := NullContainer new.! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:31'!
isEmpty

	^top isEmpty! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:07:44'!
maxSize

	^maxSize! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:05:01'!
pop

	^top removeTopContainerFrom: self.! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:28:25'!
push: anObject

	self size >= maxSize ifTrue: [self error: LimitedSizeStack stackCannotAddContainersIfMaxSizeIsReached].
	
	top addContainerWith: anObject to: self! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:12:29'!
size

	^top sizeCounter: 0.! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:48'!
top

	^top getContent! !

!LimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:07:01'!
withFixedSize: aSize
	
	maxSize := aSize! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedSizeStack class' category: 'Stack-Exercise'!
LimitedSizeStack class
	instanceVariableNames: ''!

!LimitedSizeStack class methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 17:05:51'!
stackCannotAddContainersIfMaxSizeIsReached

	^'stackCannotAddContainersIfMaxSizeIsReached'! !


!classDefinition: #UnlimitedSizeStack category: 'Stack-Exercise'!
OOStack subclass: #UnlimitedSizeStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:13'!
changeTopTo: aContainer

	top := aContainer! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:27'!
initialize

	top := NullContainer new.! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:31'!
isEmpty

	^top isEmpty! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:35'!
pop

	^top removeTopContainerFrom: self.! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:39'!
push: anObject

	top addContainerWith: anObject to: self! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:44'!
size

	^top sizeCounter: 0.! !

!UnlimitedSizeStack methodsFor: 'as yet unclassified' stamp: 'FR 11/4/2021 16:47:48'!
top

	^top getContent! !


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
