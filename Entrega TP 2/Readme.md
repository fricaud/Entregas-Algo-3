Código Repetido
Este ejercicio tiene por objetivo que saquen el código repetido que encuentren en el modelo y en los tests. Por ej. entre el test01 y test02.

Los tests provistos ya funcionan, simplemente hay que sacar el código repetido y los tests deben seguir funcionando.

Se pueden modificar las clases provistas, sólo para eliminar código repetido. No se puede modificar lo que verifican los tests. Es decir, sólo se puede hacer un cambio de diseño de tal manera que siga testeando lo mismo, que la funcionalidad sea la misma, pero que no haya código repetido.

Consejo: Comiencen por intentar quitar el código repetido de los tests, y luego sigan por el modelo.

Aclaración: Para hacer este ejercicio más sencillo se modela a un Customer utilizando un String en vez de una clase Customer. No es el objetivo del ejercicio que ustedes corrijan esta decisión, ni las consecuencias que trae consigo (por ej. que no se pueda agregar al CustomerBook dos Customers diferentes con el mismo nombre).

Resolución: 

Para este ejercicio, seguimos el algoritmo para eliminar código repetido cada vez que encontramos líneas similares dentro y entre los métodos de las pruebas y el modelo del libro de clientes.

Comenzamos analizando las pruebas, las cuáles tenían a veces muchos procesos repetidos o que ocupaban varias líneas e intentamos disminuir todo a lo mínimo posible.

La mayoría de los mensajes del modelo, en nuestra opinión, no necesitaban muchos cambios. Modificamos solamente 2 de ellos ya que se podían usar algunos mensajes propios del libro y creamos un método para recorrer las colecciones, simplificando el método para eliminar clientes.
