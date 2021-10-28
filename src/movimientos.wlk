import wollok.game.*

import personajes.*

object arriba {
	
	method movimiento(personaje) = personaje.position().up(1)
	
}

object abajo{
	
	method movimiento(personaje) = personaje.position().down(1)
		
}

object derecha{
	
	method movimiento(personaje) = personaje.position().right(1)
	
}

object izquierda{
	
	method movimiento(personaje) = personaje.position().left(1)
}