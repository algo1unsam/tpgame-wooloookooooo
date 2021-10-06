import wollok.game.*


object nave {
	var property position = game.center() //ver donde empezar
	var property image = "nave.png"
	
	method moverseA(direccion) {
		self.position(direccion.mover())
	}
	

}

