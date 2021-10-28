import wollok.game.*
import movimientos.*
import tanques.*
import config.*

class Bloques{
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia
	
	method fueImpactado(bala){
		if(not self.dejaPasarBala()){
			if(self.seRompe()){
				bala.remover()
				self.remover()
			} else {
				bala.remover()
			}
		}
	}
	
	method fueImpactadoPorEnemigo(bala) {
		self.fueImpactado(bala)
	}
	
	method remover() {
		game.removeVisual(self)
		//agregar sonido
	}
	
	method seRompe()
	
	method dejaPasarTank()
	
	method dejaPasarBala()
}

class BloquesDuros inherits Bloques{
	override method dejaPasarTank() = false
}

class BloquesBlandos inherits Bloques{
	override method dejaPasarTank() = true
}

class Acero inherits BloquesDuros{
	const property image = "acero.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = false
}

class Ladrillo inherits BloquesDuros{
	const property image = "ladrillos.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = true
}

class Agua inherits BloquesDuros{
	const property image = "agua.png" //falta agregar imagen
	
	override method dejaPasarBala() = true
	override method seRompe() = false
}

class Arbusto inherits BloquesBlandos{
	const property image = "arbusto.png" //falta agregar imagen
	
	override method dejaPasarBala() = true
	override method seRompe() = false
}

object aguila{
	const property position = game.origin()
	var property image = "aguila.png"
}