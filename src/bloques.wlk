import wollok.game.*
import movimientos.*
import tanques.*

class Bloques{
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia
	
	method fueImpactado(bala){
		if(self.seRompe()){
			self.remover()
			bala.remover()	
		} else if(not self.dejaPasar()){
			bala.remover()
		}
	}
	
	method fueImpactadoPorEnemigo(bala) {
		self.fueImpactado(bala)
	}
	
	method remover() {game.removeVisual(self)}
	
	method seRompe()
	
	method dejaPasar()
}

class BloquesDuros inherits Bloques{
	override method dejaPasar() = false
	
}

class BloquesBlandos inherits Bloques{
	override method dejaPasar() = true
}

class Acero inherits BloquesDuros{
	const property image = "acero.png" 
	
	override method seRompe() = false
}

class Ladrillo inherits BloquesDuros{
	const property image = "ladrillos.png" 
	
	override method seRompe() = true
}