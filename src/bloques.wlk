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
	
	method dejaPasarBala()
	
	method dejaPasarTank() = false
}

class Acero inherits Bloques{
	const property image = "acero.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = false
}

class Ladrillo inherits Bloques{
	const property image = "ladrillos.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = true
}

class Agua inherits Bloques{
	const property image = "agua.png" 
	
	override method dejaPasarBala() = true
	override method seRompe() = false
}

class Arbusto inherits Bloques{
	const property image = "arbusto.png" 
	
	override method dejaPasarTank() = true
	override method dejaPasarBala() = true
	override method seRompe() = false
}

object aguila{
	const property position = game.at(12,20)
	var property image = "aguila.png"
	
	method dejaPasarTank() = false
	method dejaPasarBala() = false
	method seRompe() = true
	
	method remover(){
		game.removeVisual(self)
		config.gameOver() // termina el juego
	}
	
	method fueImpactado(bala){
		bala.remover()
		self.remover()
	}
	
	method fueImpactadoPorEnemigo(bala) {
		self.fueImpactado(bala)
	}
}