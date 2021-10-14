!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 18:34:23'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	
	customerBook := CustomerBook new.
	
	self verificarQueElTiempoDeOperacion:[customerBook addCustomerNamed: 'John Lennon'.] seaMenorA: 50.
	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 18:35:15'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self verificarQueElTiempoDeOperacion:[customerBook removeCustomerNamed: paulMcCartney.] seaMenorA: 100.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 17:03:01'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 16:38:51'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 17:41:28'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self agregarYSuspenderDe: customerBook A: paulMcCartney.
	
	self AssertsSobreClientesSuspendidosDe: customerBook activos: 0 suspendidos: 1 totales: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 17:42:21'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self agregarYSuspenderDe: customerBook A: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	self AssertsSobreClientesSuspendidosDe: customerBook activos: 0 suspendidos: 0 totales: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 17:57:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarSiEnElLibro: customerBook alSuspenderA: 'Ringo Starr' noSeBorreA: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'JML 10/11/2021 17:58:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self agregarYSuspenderDe: customerBook A: johnLennon .
	
	self verificarSiEnElLibro: customerBook alSuspenderA: johnLennon noSeBorreA: johnLennon.
	
! !


!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 18:04:22'!
AssertsSobreClientesSuspendidosDe: libroDeClientes activos: clientesActivosEsperados suspendidos: clientesSuspendidosEsperados totales: clientesTotalesEsperados 

	self assert: clientesActivosEsperados equals: libroDeClientes numberOfActiveCustomers.
	self assert: clientesSuspendidosEsperados equals: libroDeClientes numberOfSuspendedCustomers.
	self assert:  clientesTotalesEsperados equals: libroDeClientes numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 18:05:48'!
agregarYSuspenderDe: libroDeClientes A: nombreDeCliente
	
	libroDeClientes addCustomerNamed: nombreDeCliente.

	libroDeClientes suspendCustomerNamed: nombreDeCliente.! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 16:16:33'!
calcularTiempoDeOperacion: operacionConLibro

	|millisecondsBeforeRunning millisecondsAfterRunning tiempoDeOperacion|
	
	millisecondsBeforeRunning := self obtenerTiempoActualEnMilisegundos.
	operacionConLibro.
	millisecondsAfterRunning := self obtenerTiempoActualEnMilisegundos.
	
	tiempoDeOperacion := millisecondsAfterRunning - millisecondsBeforeRunning.
	
	^tiempoDeOperacion.! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 18:05:21'!
crearInstanciaEInicializarConCliente: nombreDeCliente
	^CustomerBook new addCustomerNamed: nombreDeCliente.

	! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/10/2021 20:11:41'!
obtenerTiempoActualEnMilisegundos
	^Time millisecondClockValue * millisecond.
! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 18:32:17'!
verificarQueElTiempoDeOperacion: operacionConLibro seaMenorA: milisegundos

	|millisecondsBeforeRunning millisecondsAfterRunning tiempoDeOperacion|
	
	millisecondsBeforeRunning := self obtenerTiempoActualEnMilisegundos.
	operacionConLibro.
	millisecondsAfterRunning := self obtenerTiempoActualEnMilisegundos.
	
	tiempoDeOperacion := millisecondsAfterRunning - millisecondsBeforeRunning.
	
	self assert: ( tiempoDeOperacion) < (milisegundos * millisecond).! !

!CustomerBookTest methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 18:03:12'!
verificarSiEnElLibro: libroDeClientes alSuspenderA: nombreDelSuspendido noSeBorreA: clienteYaIncluido
	
	[ libroDeClientes suspendCustomerNamed: nombreDelSuspendido.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: libroDeClientes numberOfCustomers = 1.
			self assert: (libroDeClientes includesCustomerNamed: clienteYaIncluido) ]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'JML 10/11/2021 18:40:20'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'JML 10/11/2021 19:05:55'!
removeCustomerNamed: aName 
 
	(self eliminarDe: active a: aName) | (self eliminarDe: suspended a: aName) 
	ifTrue: [^aName].	
	
	^NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'algoritmosParaEliminarCodigoRepetido' stamp: 'JML 10/11/2021 19:03:57'!
eliminarDe: coleccionARecorrer a: aName
	 
	1 to: coleccionARecorrer size do: 
	[ :index |
		aName = (coleccionARecorrer at: index)
			ifTrue: [
				coleccionARecorrer removeAt: index.
				^ true.
			] 
	].

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
