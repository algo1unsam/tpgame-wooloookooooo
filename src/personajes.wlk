import wollok.game.*

class Limites{
	var property position 
	const property image = "limite.png"
}

object ovni {
	var property position = game.origin() 
	var property image = "ovvni200.png"
	
	method moverseA(direccion) {
		if (self.objetosAlrededor().map({posicion => posicion.allElements()}).size() == 1){
			self.position(direccion.movimiento(self))
		}
		
	}
	
	method objetosAlrededor(){
		return [self.position().up(1),self.position().down(1),self.position().left(1),self.position().right(1)]
	}
}

object alien {
	var property position = game.at(10,5)//ver donde empezar
	var property image = "aliens.png"	
}

object nave {
	var property position = game.at(1,15)//ver donde empezar
	var property image = "naveterrestre.png"	
}
