import wollok.game.*
import movimientos.*
import tanques.*

class Bloques{
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia
	
	method esDisparado(bala){
		if(self.seRompe()){
			self.remover()
		}
		bala.remover()	
	}
	
	method remover() {game.removeVisual(self)}
	
	method seRompe()
}

class BloquesDuros inherits Bloques{
	method dejaPasar() = false
	
}

class BloquesBlandos inherits Bloques{
	method dejaPasar() = true
}

class Acero inherits BloquesDuros{
	const property image = "acero.png" 
	
	override method seRompe() = false
}

class Ladrillo inherits BloquesDuros{
	var property fueGolpeado = 0
	const property image = "ladrillos.png" 
	
	method vida() = 1
	override method seRompe() = true
}