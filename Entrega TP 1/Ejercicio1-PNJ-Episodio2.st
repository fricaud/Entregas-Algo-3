!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'frases cantidadDeInteraccionesPorPersones frasesPrometedor'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:33:11'!
cambiarOpinionyReiniciarHilosDe: unPersonajeJugadorAInteractuar
	PuebloDeRiverwood cambiarOpinionParaBienSobre: unPersonajeJugadorAInteractuar.
	TreborElGuardiaDeSkyrim olvidarAPersona: unPersonajeJugadorAInteractuar.
	self olvidarAPersona: unPersonajeJugadorAInteractuar.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:49:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorPersones := ((Dictionary new) add: (#hamilton->0); yourself).
	frasesPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:44:08'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaDeCarolina |
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	respuestaDeCarolina:= self responderSegunCantidadDeInteraccionesYOpinionDeRiverwood:unPersonajeJugadorAInteractuar.
	(cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar) >= 3 ifTrue:[self cambiarOpinionyReiniciarHilosDe: unPersonajeJugadorAInteractuar].
	^respuestaDeCarolina! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:09:50'!
olvidar
	cantidadDeInteraccionesPorPersones := Dictionary new.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:11:16'!
olvidarAPersona: unPersonajeJugadorAInteractuar
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar put:0.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:07:19'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar ifAbsentPut:0.
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar put: (cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar)+1.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:10:56'!
responderSegunCantidadDeInteraccionesYOpinionDeRiverwood: unPersonajeJugadorAInteractuar
	(PuebloDeRiverwood verificarOpinionSobre: unPersonajeJugadorAInteractuar) 
	ifTrue: [	^ frasesPrometedor at: ((cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar) min: frases size)]
	ifFalse: [	^ frases at: ((cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar) min: frases size)]! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FR 9/30/2021 17:34:15'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeSkyrim! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FR 9/30/2021 17:34:55'!
hamilton
	^#hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'FR 9/30/2021 17:43:09'!
tirion
	^#tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FR 10/2/2021 22:38:25'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^PuebloDeRiverwood verificarOpinionSobre: unPersonaje! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FR 10/2/2021 22:20:18'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidar! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FR 10/2/2021 22:20:42'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidar! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'FR 10/2/2021 22:34:45'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood cambiarOpinionParaBienSobre: self hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'FR 9/30/2021 02:20:29'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadía en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FR 9/27/2021 21:35:55'!
hamilton
	^#hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'FR 9/30/2021 17:44:53'!
tirion
	^#tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FR 9/30/2021 02:19:50'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidar! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'FR 9/30/2021 02:18:16'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood cambiarOpinionParaBienSobre: self hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloDeRiverwood class
	instanceVariableNames: 'esPrometedor'!

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FR 9/30/2021 02:17:55'!
cambiarOpinionParaBienSobre: unPersonajeJugadorAInteractuar
	esPrometedor at: unPersonajeJugadorAInteractuar put:true.
	! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FR 9/30/2021 02:07:42'!
cambiarOpinionParaMalSobre: unPersonajeJugadorAInteractuar
	esPrometedor at: unPersonajeJugadorAInteractuar put:false.
	! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:49:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	esPrometedor := ((Dictionary new) add: (#hamilton->true); yourself).! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FR 9/30/2021 02:08:16'!
olvidar
	esPrometedor := Dictionary new.! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'FR 9/30/2021 02:03:44'!
verificarOpinionSobre: unPersonajeJugadorAInteractuar
	esPrometedor at: unPersonajeJugadorAInteractuar ifAbsentPut:false.
	^esPrometedor at: unPersonajeJugadorAInteractuar.
	! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesPrometedor frases cantidadDeInteraccionesPorPersones'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FR 9/30/2021 02:13:06'!
interactuarCon: unPersonajeJugadorAInteractuar
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	^self responderSegunCantidadDeInteraccionesYOpinionDeRiverwood:unPersonajeJugadorAInteractuar! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FR 10/2/2021 22:06:08'!
olvidar
	cantidadDeInteraccionesPorPersones := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FR 9/30/2021 01:32:38'!
olvidarAPersona: unPersonajeJugadorAInteractuar
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar put:0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FR 10/2/2021 22:02:42'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar ifAbsentPut:0.
	cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar put: (cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar)+1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'FR 10/2/2021 22:05:38'!
responderSegunCantidadDeInteraccionesYOpinionDeRiverwood: unPersonajeJugadorAInteractuar
	(PuebloDeRiverwood verificarOpinionSobre: unPersonajeJugadorAInteractuar) 
	ifTrue: [	^ frasesPrometedor at: ((cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar) min: frases size)]
	ifFalse: [	^ frases at: ((cantidadDeInteraccionesPorPersones at: unPersonajeJugadorAInteractuar) min: frases size)]! !



!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'FR 10/2/2021 22:49:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadía en Riverwood' ).
	frases := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	cantidadDeInteraccionesPorPersones := ((Dictionary new) add: (#hamilton->2); yourself).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
PuebloDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
