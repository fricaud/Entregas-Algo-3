!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'JML 10/21/2021 20:04:23'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'JML 10/23/2021 18:55:38'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:30:52'!
* aMultiplier

	^aMultiplier multiplyAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:30:56'!
+ anAddend

	^anAddend beAddedToAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:31:02'!
- aSubtrahend 

	^aSubtrahend substractFromAnEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:31:07'!
/ aDivisor 

	^aDivisor divideAnEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:48:38'!
beAddedToAFraccion: anAugend

	"Los par�ntesis son innecesarios pero facilitan la lectura"

	^(anAugend denominator * self + anAugend numerator) / anAugend denominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JML 10/23/2021 18:08:15'!
beAddedToAnEntero: anAugend

	^Entero with: anAugend integerValue + self integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:49:58'!
divideAFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self)
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:23:01'!
divideAnEntero: aDividend

	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/25/2021 16:53:15'!
fibonacci

	"| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci"
	self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:34:05'!
multiplyAFraccion: aMultiplicand
	
	^aMultiplicand numerator * self / aMultiplicand denominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:51:56'!
multiplyAnEntero: aMultiplicand

	^Entero with: aMultiplicand integerValue * self integerValue.
	 ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:57:14'!
substractFromAFraccion: aMinuend

	"Los par�ntesis son innecesarios pero facilitan la lectura"

	^(aMinuend numerator - aMinuend denominator * self) / aMinuend denominator.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:58:41'!
substractFromAnEntero: aMinuend

	^Entero with: (aMinuend integerValue - self integerValue).! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'FR 10/25/2021 17:26:02'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [^Zero new initalizeWith: aValue].
	
	aValue = 1 ifTrue: [^One new initalizeWith: aValue].
	
	aValue > 0 ifTrue: [^Positivo new initalizeWith: aValue].
	
	aValue < 0 ifTrue: [^Negativo new initalizeWith: aValue].

	! !


!Entero class methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 17:11:14'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:26:12'!
beDenominatorFor: aNumerator

	^aNumerator negated / self negated.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:28:11'!
beNumeratorFor: aDenominator

	^Fraccion new initializeWith: self over: aDenominator.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 17:11:30'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription.! !


!classDefinition: #One category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!One methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:26:00'!
beDenominatorFor: aNumerator

	^aNumerator.! !

!One methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:28:22'!
beNumeratorFor: aDenominator
	^Fraccion new initializeWith: self over: aDenominator.! !

!One methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 17:07:41'!
fibonacci
	^Entero with:1.! !


!classDefinition: #Positivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Positivo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:31:11'!
beDenominatorFor: aNumerator

	^aNumerator beNumeratorFor: self.! !

!Positivo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:26:55'!
beNumeratorFor: aDenominator

	^Fraccion new initializeWith: self over: aDenominator.! !

!Positivo methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 17:27:46'!
fibonacci
		| one two parcialUno parcialDos|
	
	one := Entero with: 1.
	two := Entero with: 2.
	parcialUno := Entero with: (self-one) integerValue.
	parcialDos := Entero with: (self-two) integerValue.
	
	^parcialUno fibonacci + parcialDos fibonacci! !


!classDefinition: #Zero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Zero methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:26:31'!
beDenominatorFor: aNumerator

	^self error: Fraccion canNotDivideByZeroErrorDescription.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 18:27:22'!
beNumeratorFor: aDenominator

	^Entero with: 0.! !

!Zero methodsFor: 'as yet unclassified' stamp: 'FR 10/25/2021 17:07:32'!
fibonacci
	^Entero with:1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:30:19'!
* aMultiplier 
	
	^aMultiplier multiplyAFraccion: self.

! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:30:28'!
+ anAddend 
	
	^anAddend beAddedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/25/2021 17:28:28'!
- aSubtrahend 

	^aSubtrahend substractFromAFraccion: self.
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:30:40'!
/ aDivisor 

	^aDivisor divideAFraccion: self
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:43:44'!
beAddedToAFraccion: anAugend

	| newNumerator newDenominator|

	newNumerator := (anAugend numerator * denominator) + (anAugend denominator * numerator).
	newDenominator := anAugend denominator * denominator.
	
	^newNumerator/ newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:49:04'!
beAddedToAnEntero: anAugend
	
	"Los par�ntesis son innecesarios pero facilitan la lectura"

	^(anAugend * denominator + numerator) / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:24:40'!
divideAFraccion: aDividend

	^(aDividend numerator * denominator) / (aDividend denominator * numerator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:27:05'!
divideAnEntero: aDividend

	^aDividend * denominator/ numerator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:28:21'!
multiplyAFraccion: aMultiplicand

	^(aMultiplicand numerator * numerator) / (aMultiplicand denominator * denominator)
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:33:32'!
multiplyAnEntero: aMultiplicand

	^aMultiplicand * numerator / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:29:03'!
substractFromAFraccion: aMinuend

	| newNumerator newDenominator |
		
	newNumerator := aMinuend numerator * denominator - aMinuend denominator * numerator.
	newDenominator := aMinuend denominator * denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FR 10/24/2021 20:49:14'!
substractFromAnEntero: aMinuend

	"Los par�ntesis son innecesarios pero facilitan la lectura"
	
	^(aMinuend * denominator - numerator) / denominator.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'FR 10/25/2021 18:02:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'FR 10/25/2021 18:33:50'!
with: aDividend over: aDivisor
	
	|denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator beDenominatorFor: numerator.
! !
