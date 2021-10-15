import wollok.game.*

import personajes.*


object arriba {
	//Corregir tamaño escenario para arreglar limite -2	
	method mover(){
		if (ovni.position().y() < game.height()-2) {
			
			return ovni.position().up(1)
		}
		else {
			return ovni.position()
		}
	}
		
}

object abajo{
	
	method mover(){
		if (ovni.position().y() > (game.height()/2) ) {
			
			return ovni.position().down(1)
		}
		else {
			return ovni.position()
		}
	}
		
}

object derecha{
	//Corregir tamaño escenario para arreglar limite -3
	method mover(){
		if (ovni.position().x() <= game.width()-4) {
			
			return ovni.position().right(1)
		}
		else {
			return ovni.position()
		}
	}
	
}

object izquierda{
	
	method mover(){
		if (ovni.position().x() >= 0 ) {
			return ovni.position().left(1)
		}
		else {
			return ovni.position()
		}
	}
}