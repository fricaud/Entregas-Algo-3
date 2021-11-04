
Para este trabajo nuevamente presentamos dos modelos: Uno que resuelve únicamente la parte principal del tp y el segundo una propuesta para la resolución de la parte extra. 

Para la primer parte comenzamos con un modelado simple que nos permita pasar los test.  
Creamos los mensajes que vimos en los tests: pop, push, top, isEmpty. Luego, agregamos el mensaje initialize para poder crear una OrderedCollection que usamos para nuestro stack.
Este modelo contenía ifs y la mayoría de las interacciones solo afectaban al tope de esta colección. 

Luego de tener completa esta solución y escuchar posibles soluciones en la clase, procedimos a
deliberar como ibamos a modelar el stack de manera definitiva. En la catedra se habian propuesto
dos soluciones: Modelar el tope del stack, similar a una torre de hanoi o modelar a partir de estados del stack. A ambos nos parecio mas intuitiva la primera solucion, por lo que decidimos ir con esa opcion.

Creamos una Abstracción de contenedores de 'comportamiento nulo' o de'comportamiento real'. Estos últimos contienen una referencia al contenedor anterior. De esta manera, creabamos el stack con una variable top con un contenedor nulo que nos permite saber en que momento el stack está vacío ya que este contenedor tiene comportamiento nulo. El stack se comunica con el tope, el cual dependiendo el tipo de contenedor sea nos devuelve la interacción deseada para un stack lleno o vacío. 

Luego avanzamos con el buscador de prefijo para el cual creamos el mensaje find:in: el cual itera el stack y lo guarda en una OrderedCollection y luego itera la OrderedCollection para rearmar el stack. Por último, utilizamos el mensaje select de la OrderedCollection para filtrar los strings con el mensaje BeginsWith:. Para las verificaciones del prefijo optamos por dejar los ifs en el método find:in: ya que los consideramos ifs accidentales y no merecían crear una abstracción de prefijo para resolverlos con polimorfismo. Para asegurar que todo funcione, creamos siete pruebas que verifican el correcto funcionamiento del buscador de prefijo. Para esto primero comenzamos con pruebas simples que nos permitian verificar el comportamiento esperado y luego avanzamos con los casos borde. 

Para la parte extra, creamos dos nuevas abstracciones como subclases del stack, 'limitedSizeStack' y 'unlimitedSizeStack'. Si se crea un stack simplemente con el mensaje 'new' se creará un stack sin límite de tamaño, y creamos el mensaje 'with:' para que el stack se cree con un tamaño máximo, el cual queda guardado en una variable de instancia. Las únicas diferencias entre el comportamiento de ambos es que el limited responde al mensaje maxSize que devuelve el tamaño máximo que puede tener el stack y que esta subclase también realiza una verificación antes de hacer un 'push' comparando el tamaño actual con el máximo. Una vez más, optamos por dejar este chequeo en este mensaje, ya que lo consideramos un if accidental.

Para verificar el correcto funcionamiento de esta nueva abstracción, duplicamos todos los tests originales y los que habíamos agregado nosotros, agregando dos tests adicionales para la nueva funcionalidad del limitedSizeStack.




