import wollok.game.*
import config.*

class Bloque{
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
	
	method colisionoConTank(){
		//vacio
	}
}

class Acero inherits Bloque{
	const property image = "acero.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = false
}

class Ladrillo inherits Bloque{
	const property image = "ladrillos.png" 
	
	override method dejaPasarBala() = false
	override method seRompe() = true
}

class Agua inherits Bloque{
	const property image = "agua.png" 
	
	override method dejaPasarBala() = true
	override method seRompe() = false
}

class Arbusto inherits Bloque{
	const property image = "arbusto.png" 
	
	override method dejaPasarTank() = true
	override method dejaPasarBala() = true
	override method seRompe() = false
}

object aguila{
	const property position = game.at(12,19)
	var property image = "aguila.png"
	
	method dejaPasarTank() = true
	method dejaPasarBala() = false
	method seRompe() = true
	
	method remover(){
		game.removeVisual(self)
		config.gameOver() 
	}
	
	method fueImpactado(bala){
		bala.remover()
		self.remover()
	}
	
	method colisionoConTank(){
		config.win()
	}
	
	method fueImpactadoPorEnemigo(bala) {
		self.fueImpactado(bala)
	}
}