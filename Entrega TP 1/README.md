# Trabajo-Practico-NPCs-Skyrim

Consigna:

Para la alegría de todas y todos vamos a continuar trabajando con los NPCs (Non-Player Character) o PNJ (personaje no jugador) en castellano. En esta ocasión debemos extender las capacidades de Trebor, nuestro guardia de Skyrim, e incorporar un nuevo personaje.

Vengan de a muches
El guardia debe tener la capacidad de interactuar con varios personajes jugadores (PJ) y mantener un hilo de conversación para cada uno de ellos. Es decir, por ejemplo si tenemos los PJ Hamilton y Tirion, si interactúa por primera vez con Hamilton le responde 'Hola forastero' y si luego interactúa por primera vez con Tirion le debe responder también 'Hola forastero'.

Opinión del pueblo
Además, el guardia debe tener la capacidad de tener diálogos diferentes según la opinión que tiene el pueblo, Riverwood, sobre el personaje con el que está interactuando. El pueblo puede ver a un personaje jugador como prometedor o desconocido.

Cuando Trebor habla con un personaje calificado como prometedor por Riverwood su hilo de diálogo es: (1) 'Bienvenido aventurero!', (2) 'Espero que tengas una buena estadía en Riverwood'.

Cuando habla con un personaje desconocido por Riverwood su hilo de diálogo es (1) 'Hola forastero', (2) '¿Todo bien?' y (3)'¿Algún problema?'

Influencer
También se pide agregar un nuevo personaje no jugador Carolina la curandera de Riverwood. Debe funcionar de la misma forma que el guardia pero su repertorio es:

Personajes prometedores según Riverwood: (1) 'Salud aventurero!', (2) 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'

Personajes desconocidos por Riverwood: (1) '¿Estás enfermo Forastero?', (2) 'Ah, solo quieres conversar' y (3) 'Cuando tengas una aflicción, ven a verme’

Además, Carolina es muy influyente en la opinión de Riverwood, cuando un personaje completa el diálogo con la curandera, es decir llega a la última frase de su repertorio, esto hace que pase a ser calificado como prometedor según Riverwood, y que tanto el guardia como Carolina reinicien sus hilos de conversaciones con dicho personaje.

Punto de partida
Deben importar el código inicial Ejercicio1-PNJ-Episodio2.CodigoInicial.st y construir su solución a partir de ahí. En dicho paquete encontrarán al objeto TreborElGuardiaDeSkyrim, con el mismo funcionamiento visto en clase y a dos objetos que agrupan las pruebas de funcionamiento del guaria y la curandera PruebasInteracionesConTreborElGuardia y PruebasInteracionesConCarolinaLaCurandera. El objetivo de estas pruebas es ayudarlos/as a implementar lo pedido. En ellas encontrarán que tienen que implementar algunos métodos para poder completar las pruebas.

Sugerencias:
Vayan haciendo pasar las pruebas PruebasInteracionesConTreborElGuardia según el orden de cada prueba (de 1 a la 9). Y luego hagan pasar las pruebas PruebasInteracionesConCarolinaLaCurandera y también aquí siguiendo el orden sugerido (de 1 a la 11)

Resolución:

Para resolver este ejercicio creamos dos objetos TreborElGuardiaDeSkyrim y CarolinaLaCuranderaDeSkyrim. Ambos son objetos muy parecidos ya que los mismos interactuan con gente de distintas formas segun la cantidad de interacciones y la reputación que tengan estas personas en el pueblo (Riverwood).

Para poder controlar la reputación, creamos un tercer objeto llamado PuebloDeRiverwood el cuál contiene un diccionario que almacena los nombres de los personajes jugador, junto al estátus que maneja actualmente.

Además le agregamos los mensajes para verificar el estátus y cambiarlo (tanto para bien como para mal) dentro de este objeto.

Luego, Carolina y Trebor (respectivamente) tienen, al igual que el Pueblo, un diccionaro con el que almacenan la cantidad de interacciones que tienen con cada individuo, de manera que antes de enviar una respuesta, corroboran el status del personaje jugador, y la cantidad de veces que este interactuó con tanto Trebor como Carolina.

Por último, Carolina tiene un mensaje que puede enviar al PuebloDeRiverwood cuando esta termina un hilo, para cambiar la opinión sobre el personaje jugador a positiva, haciendo que también tanto ella como Trebor olviden la cantidad de interacciones con ese personaje jugador en particular.

Carolina tiene un método que le envía los mensajes correspondientes a Trebor y el Pueblo para poder realizar esto.
