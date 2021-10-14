import wollok.game.*

import personajes.*


object arriba {
	//Corregir tamaño escenario para arreglar limite -2	
	method mover(){
		if (nave.position().y() < game.height()-2) {
			
			return nave.position().up(1)
		}
		else {
			return nave.position()
		}
	}
		
}

object abajo{
	
	method mover(){
		if (nave.position().y() > (game.height()/2) ) {
			
			return nave.position().down(1)
		}
		else {
			return nave.position()
		}
	}
		
}

object derecha{
	//Corregir tamaño escenario para arreglar limite -3
	method mover(){
		if (nave.position().x() <= game.width()-4) {
			
			return nave.position().right(1)
		}
		else {
			return nave.position()
		}
	}
	
}

object izquierda{
	
	method mover(){
		if (nave.position().x() >= 0 ) {
			return nave.position().left(1)
		}
		else {
			return nave.position()
		}
	}
}