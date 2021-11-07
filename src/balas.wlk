import wollok.game.*
import tanques.*

class Bala {
	const property esEnemiga 
	const property quienDisparo
	const property sentido
	var property position
	
	method nombreOnTick() = "bala"+self.identity().toString()+" disparada"
	
	method image () = "bala"+ sentido.agregado() +".png"
	
	method remover() {
		game.removeVisual(self)
		game.removeTickEvent(self.nombreOnTick())//hacer un metodo del nombre
		//agregar sonido
	}
	
	method mover(){
		self.position(sentido.position(self))
	}
	
	method disparar() {
		game.addVisual(self)
		game.onTick(200, self.nombreOnTick(), { self.mover() })
		self.impacto()
	}
	
	method impacto(){
		game.whenCollideDo(self, {cosa => cosa.fueImpactado(self)})
	}
	
	method dejaPasarTank() = false
	
	method dejaPasarBala() = true
	
	method fueImpactado(bala){
		if(not self.esEnemiga() and not bala.esEnemiga()){
			
		} else {
			self.remover()
		}
	}
	
	method colisionoConTank(){
		
	}
	
	method contarKill(){
		quienDisparo.aumentarKill()
	}
}

