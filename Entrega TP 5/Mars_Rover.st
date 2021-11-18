!classDefinition: #TestMarsRover category: 'Mars Rover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'MarsRoverPrueba norte sur este oeste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:20:48'!
setUp
	
	MarsRoverPrueba := MarsRover new.
! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 19:33:13'!
test01MarsRoverInformaSuPosicion

	self assert: MarsRoverPrueba informarPosicion equals: 0@0.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:21:14'!
test02MarsRoverInformaSuDireccion

	self assert: MarsRoverPrueba informarDireccion class equals: Norte.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:36:05'!
test03MarsRoverAvanzaUnPuntoEnDireccionNorte

	MarsRoverPrueba recibirInstrucciones: 'f'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@1.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:36:30'!
test04MarsRoverRetrocedeUnpuntoEnDireccionNorte

	MarsRoverPrueba recibirInstrucciones: 'b'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@-1.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:21:06'!
test05MarsRoverRotaHaciaLaIzquierdaAlRecibirL

	MarsRoverPrueba recibirInstrucciones: 'l'.
	
	self assert: MarsRoverPrueba informarDireccion class equals: Oeste.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:21:42'!
test06MarsRoverRotaHaciaLaDerechaAlRecibirR

	MarsRoverPrueba recibirInstrucciones: 'r'.
	
	self assert: MarsRoverPrueba informarDireccion class equals: Este.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:22:10'!
test07MarsRoverRota360gradosHaciaLaDerechaCorrectamente

	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion class equals: Este.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion class equals: Sur.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion class equals: Oeste.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion class equals: Norte.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:22:43'!
test08MarsRoverRota360gradosHaciaLaIzquierdaCorrectamente

	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion class equals: Oeste.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion class equals: Sur.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion class equals: Este.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion class equals: Norte.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:35:44'!
test09MarsRoverAvanzaUnPuntoEnDireccionEste

	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'f'.
	
	
	self assert: MarsRoverPrueba informarPosicion equals: 1@0.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:35:49'!
test10MarsRoverAvanzaUnPuntoEnDireccionSur

	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'f'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@-1.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:35:54'!
test11MarsRoverAvanzaUnPuntoEnDireccionOeste

	MarsRoverPrueba recibirInstrucciones: 'l'.
	MarsRoverPrueba recibirInstrucciones: 'f'.

	self assert: MarsRoverPrueba informarPosicion equals: -1@0.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:33:51'!
test12MarsRoverRetrocedeUnPuntoEnDireccionEste

	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'b'.
	
	
	self assert: MarsRoverPrueba informarPosicion equals: -1@0.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:34:55'!
test13MarsRoverRetrocedeUnPuntoEnDireccionSur

	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'r'.
	MarsRoverPrueba recibirInstrucciones: 'b'.
	
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@1.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:35:27'!
test14MarsRoverRetrocedeUnPuntoEnDireccionOeste

	MarsRoverPrueba recibirInstrucciones: 'l'.
	MarsRoverPrueba recibirInstrucciones: 'b'.
	
	
	self assert: MarsRoverPrueba informarPosicion equals: 1@0.
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:23:01'!
test15MarsRoverInterpretaCorrectamenteUnaSecuenciaCortaDeInstrucciones

	MarsRoverPrueba recibirInstrucciones: 'flf'.
	
	self assert: MarsRoverPrueba informarPosicion equals: -1@1.
	self assert: MarsRoverPrueba informarDireccion class equals: Oeste.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:42:25'!
test16MarsRoverAvanzaVariosPuntosEnLaMismaDireccion

	MarsRoverPrueba recibirInstrucciones: 'fff'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@3.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:42:48'!
test17MarsRoverRetrocedeVariosPuntosEnLaMismaDireccion

	MarsRoverPrueba recibirInstrucciones: 'bbb'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@-3.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:23:12'!
test18MarsRoverInterpretaCorrectamenteUnaSecuenciaLargaDeInstrucciones

	MarsRoverPrueba recibirInstrucciones: 'flfbrrffbllfbrfrrff'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 1@0.
	self assert: MarsRoverPrueba informarDireccion class equals: Sur.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:44:49'!
test19MarsRoverCuandoEncuentraUnComandoInvalido

	self 
		should: [MarsRoverPrueba recibirInstrucciones: '?'] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: anError messageText equals: MarsRover instruccionDesconocida.
		].
		
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:43:55'!
test20MarsRoverCuandoEncuentraUnComandoInvalidoAlPrincipioDeLasInstruccionesNoEjecutaNingunaInstruccion
	
	self 
		should: [MarsRoverPrueba recibirInstrucciones: 'xfbflbfbilfib'] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: MarsRoverPrueba informarPosicion equals: 0@0.
			self assert: MarsRoverPrueba informarDireccion class equals: Norte.
		].
	
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:43:39'!
test21MarsRoverCuandoEncuentraUnComandoInvalidoNoSigueProcesandoLosComandosRestantes
	
	self 
		should: [MarsRoverPrueba recibirInstrucciones: 'ffbflb fbilfib'] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: MarsRoverPrueba informarPosicion equals: 1@2.
			self assert: MarsRoverPrueba informarDireccion class equals: Oeste.
		].
	! !


!classDefinition: #DireccionDeMarsRover category: 'Mars Rover'!
Object subclass: #DireccionDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!DireccionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:51'!
moveBackwards: unMarsRover
	^self subclassResponsibility ! !

!DireccionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:48:08'!
moveForward: unMarsRover
	^self subclassResponsibility ! !

!DireccionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:46:52'!
rotateLeft: unMarsRover
	^self subclassResponsibility ! !

!DireccionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:23'!
rotateRight: unMarsRover
	^self subclassResponsibility ! !


!classDefinition: #Este category: 'Mars Rover'!
DireccionDeMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Este methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:51'!
moveBackwards: unMarsRover

	unMarsRover retrocederEnDireccionEste ! !

!Este methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:48:08'!
moveForward: unMarsRover

	unMarsRover avanzarEnDireccionEste! !

!Este methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:46:52'!
rotateLeft: unMarsRover

	unMarsRover rotarALaIzquierdaDesdeDireccionEste ! !

!Este methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:23'!
rotateRight: unMarsRover

	unMarsRover rotarALaDerechaDesdeDireccionEste! !


!classDefinition: #Norte category: 'Mars Rover'!
DireccionDeMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:51'!
moveBackwards: unMarsRover
	
	unMarsRover retrocederEnDireccionNorte ! !

!Norte methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:48:08'!
moveForward: unMarsRover
	
	unMarsRover avanzarEnDireccionNorte ! !

!Norte methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:46:51'!
rotateLeft: unMarsRover
	
	unMarsRover rotarALaIzquierdaDesdeDireccionNorte ! !

!Norte methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:23'!
rotateRight: unMarsRover

	unMarsRover rotarALaDerechaDesdeDireccionNorte.! !


!classDefinition: #Oeste category: 'Mars Rover'!
DireccionDeMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:51'!
moveBackwards: unMarsRover

	unMarsRover retrocederEnDireccionOeste ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:48:09'!
moveForward: unMarsRover

	unMarsRover avanzarEnDireccionOeste ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:46:52'!
rotateLeft: unMarsRover

	unMarsRover rotarALaIzquierdaDesdeDireccionOeste ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:23'!
rotateRight: unMarsRover

	unMarsRover rotarALaDerechaDesdeDireccionOeste ! !


!classDefinition: #Sur category: 'Mars Rover'!
DireccionDeMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:51'!
moveBackwards: unMarsRover
	unMarsRover retrocederEnDireccionSur ! !

!Sur methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:48:08'!
moveForward: unMarsRover

	unMarsRover avanzarEnDireccionSur ! !

!Sur methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:46:52'!
rotateLeft: unMarsRover

	unMarsRover rotarALaIzquierdaDesdeDireccionSur ! !

!Sur methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:47:23'!
rotateRight: unMarsRover

	unMarsRover rotarALaDerechaDesdeDireccionSur ! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'avanzar' stamp: 'JML 11/17/2021 21:00:25'!
avanzarEnDireccionEste

	posicion := posicion + (1@0)! !

!MarsRover methodsFor: 'avanzar' stamp: 'JML 11/17/2021 21:00:09'!
avanzarEnDireccionNorte

 	posicion := posicion + (0@1)
			! !

!MarsRover methodsFor: 'avanzar' stamp: 'JML 11/17/2021 21:00:36'!
avanzarEnDireccionOeste

	posicion := posicion + (-1@0)
			! !

!MarsRover methodsFor: 'avanzar' stamp: 'JML 11/17/2021 21:00:47'!
avanzarEnDireccionSur

	posicion := posicion + (0@-1)
	! !


!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 19:38:44'!
informarDireccion
	^direccion.! !

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 19:31:56'!
informarPosicion
	^posicion! !

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/17/2021 21:11:05'!
initialize

	posicion := 0@0.
	direccion := Norte new.! !


!MarsRover methodsFor: 'instrucciones' stamp: 'JML 11/17/2021 21:48:09'!
recibirInstrucciones: aString

	aString do: [:instruccion|
		
		( 'fbrl' indexOf: instruccion ) = 0 ifTrue: [^self error: 	MarsRover instruccionDesconocida].
		
		instruccion = $f ifTrue: [direccion moveForward: self].
		
		instruccion  = $b ifTrue: [direccion moveBackwards: self].
	
		instruccion  = $l ifTrue: [direccion rotateLeft: self].
		
		instruccion  = $r ifTrue: [direccion rotateRight: self] 
		
	].
	
! !


!MarsRover methodsFor: 'retroceder' stamp: 'JML 11/17/2021 21:01:30'!
retrocederEnDireccionEste

	posicion := posicion + (-1@0)! !

!MarsRover methodsFor: 'retroceder' stamp: 'JML 11/17/2021 21:01:43'!
retrocederEnDireccionNorte

 	posicion := posicion + (0@-1)
				
				! !

!MarsRover methodsFor: 'retroceder' stamp: 'JML 11/17/2021 21:01:59'!
retrocederEnDireccionOeste

	posicion := posicion + (1@0)
			! !

!MarsRover methodsFor: 'retroceder' stamp: 'JML 11/17/2021 21:02:11'!
retrocederEnDireccionSur

	posicion := posicion + (0@1)
				! !


!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:06:36'!
rotarALaDerechaDesdeDireccionEste

	direccion := Sur new.! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:06:26'!
rotarALaDerechaDesdeDireccionNorte

	direccion := Este new.! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:06:16'!
rotarALaDerechaDesdeDireccionOeste

	direccion := Norte new.! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:06:04'!
rotarALaDerechaDesdeDireccionSur

	direccion := Oeste new.! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:05:17'!
rotarALaIzquierdaDesdeDireccionEste

	direccion := Norte new.
			! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:05:05'!
rotarALaIzquierdaDesdeDireccionNorte

	direccion := Oeste new.
				! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:05:31'!
rotarALaIzquierdaDesdeDireccionOeste

	direccion := Sur new.! !

!MarsRover methodsFor: 'rotaciones' stamp: 'JML 11/17/2021 21:05:42'!
rotarALaIzquierdaDesdeDireccionSur

	direccion := Este new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'JML 11/17/2021 21:30:07'!
instruccionDesconocida
	^'Se ha detectado una instrucción inválida, el resto de las instrucciones no se ejecutaran.'! !
