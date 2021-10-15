import wollok.game.*


object ovni {
	var property position = game.center() 
	var property image = "ovni.png"
	
	method moverseA(direccion) {
		self.position(direccion.mover())
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
