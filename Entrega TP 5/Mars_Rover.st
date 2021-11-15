!classDefinition: #TestMarsRover category: 'Mars Rover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'MarsRoverPrueba'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 19:29:09'!
setUp
	
	MarsRoverPrueba := MarsRover new.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 19:33:13'!
test01MarsRoverInformaSuPosicion

	self assert: MarsRoverPrueba informarPosicion equals: 0@0.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 19:33:51'!
test02MarsRoverInformaSuDireccion

	self assert: MarsRoverPrueba informarDireccion equals: 'N'.! !

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

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:10:29'!
test05MarsRoverRotaHaciaLaIzquierdaAlRecibirL

	MarsRoverPrueba recibirInstrucciones: 'l'.
	
	self assert: MarsRoverPrueba informarDireccion equals: 'O'.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:10:12'!
test06MarsRoverRotaHaciaLaDerechaAlRecibirR

	MarsRoverPrueba recibirInstrucciones: 'r'.
	
	self assert: MarsRoverPrueba informarDireccion equals: 'E'.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:13:33'!
test07MarsRoverRota360gradosHaciaLaDerechaCorrectamente

	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion equals: 'E'.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion equals: 'S'.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion equals: 'O'.
	
	MarsRoverPrueba recibirInstrucciones: 'r'.
	self assert: MarsRoverPrueba informarDireccion equals: 'N'.
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:14:01'!
test08MarsRoverRota360gradosHaciaLaIzquierdaCorrectamente

	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion equals: 'O'.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion equals: 'S'.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion equals: 'E'.
	
	MarsRoverPrueba recibirInstrucciones: 'l'.
	self assert: MarsRoverPrueba informarDireccion equals: 'N'.
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

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:40:18'!
test15MarsRoverInterpretaCorrectamenteUnaSecuenciaCortaDeInstrucciones

	MarsRoverPrueba recibirInstrucciones: 'flf'.
	
	self assert: MarsRoverPrueba informarPosicion equals: -1@1.
	self assert: MarsRoverPrueba informarDireccion equals: 'O'. 
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

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:44:55'!
test18MarsRoverInterpretaCorrectamenteUnaSecuenciaLargaDeInstrucciones

	MarsRoverPrueba recibirInstrucciones: 'flfbrrffbllfbrfrrff'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 1@0.
	self assert: MarsRoverPrueba informarDireccion equals: 'S'. 
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 22:02:41'!
test19MarsRoverCuandoEncuentraUnComandoInvalido
	
	self assert: (MarsRoverPrueba recibirInstrucciones: '?') equals: 'Error'.
	
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 21:54:43'!
test20MarsRoverCuandoEncuentraUnComandoInvalidoAlPrincipioDeLasInstruccionesNoEjecutaNingunaInstruccion

	MarsRoverPrueba recibirInstrucciones: 'xfbflbfbilfib'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 0@0.
	self assert: MarsRoverPrueba informarDireccion equals: 'N'. 
	! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'JML 11/14/2021 22:03:29'!
test21MarsRoverCuandoEncuentraUnComandoInvalidoNoSigueProcesandoLosComandosRestantes

	MarsRoverPrueba recibirInstrucciones: 'ffbflb fbilfib'.
	
	self assert: MarsRoverPrueba informarPosicion equals: 1@2.
	self assert: MarsRoverPrueba informarDireccion equals: 'O'. 
	! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 19:38:44'!
informarDireccion
	^direccion.! !

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 19:31:56'!
informarPosicion
	^posicion! !

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 19:38:32'!
initialize

	posicion := 0@0.
	direccion := 'N'. ! !

!MarsRover methodsFor: 'accessing' stamp: 'JML 11/14/2021 20:54:57'!
recibirInstrucciones: aString

	1 to: (aString size) do: [:x|
		
		( 'fbrl' indexOf: (aString at: x) ) = 0 ifTrue: [^'Error'].
		
		(aString at: x) = $f ifTrue: [
			
				(direccion = 'N') ifTrue: [ posicion := posicion + (0@1)].
				(direccion = 'S') ifTrue: [posicion := posicion + (0@-1)]. 
				(direccion = 'O') ifTrue: [posicion := posicion + (-1@0)]. 
				(direccion = 'E') ifTrue: [posicion := posicion + (1@0)]. 
				] .
		
		(aString at: x)  = $b ifTrue: [
			
				(direccion = 'N') ifTrue: [ posicion := posicion + (0@-1)].
				(direccion = 'S') ifTrue: [posicion := posicion + (0@1)]. 
				(direccion = 'O') ifTrue: [posicion := posicion + (1@0)]. 
				(direccion = 'E') ifTrue: [posicion := posicion + (-1@0)]. 
			
			].
	
		(aString at: x)  = $l ifTrue: [
				(direccion = 'N') ifTrue: [direccion := 'O'] ifFalse: [
					(direccion = 'S') ifTrue: [direccion := 'E'] ifFalse: [
						(direccion = 'O') ifTrue: [direccion := 'S'] ifFalse:[
							(direccion = 'E') ifTrue: [direccion := 'N']. 
							]
						]
					].
				
			].
		(aString at: x)  = $r ifTrue: [
				(direccion = 'N') ifTrue: [direccion := 'E'] ifFalse: [
					(direccion = 'S') ifTrue: [direccion := 'O'] ifFalse: [
						(direccion = 'O') ifTrue: [direccion := 'N'] ifFalse:[
							(direccion = 'E') ifTrue: [direccion := 'S']. 
							]
						]
					].

			]
		
		  
	] 
	
	
	
	! !
