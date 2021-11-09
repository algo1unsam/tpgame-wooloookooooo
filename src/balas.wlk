import wollok.game.*
import tanques.*
import config.*

class Bala {
	const property quienDisparo
	const property sentido
	var property position
	
	method nombreOnTick() = "bala"+self.identity().toString()+" disparada"
	
	method image () = "bala"+ sentido.agregado() +".png"
	
	method remover() {
		game.removeVisual(self)
		game.removeTickEvent(self.nombreOnTick())//hacer un metodo del nombre
	}
	
	method mover() {
		self.position(sentido.position(self))
	}
	
	method disparar() {
		game.addVisual(self)
		game.onTick(100, self.nombreOnTick(), { self.mover() })
		self.impacto()
	}
	
	method impacto(){
		game.whenCollideDo(self, {cosa => cosa.fueImpactado(self)})
	}
	
	method dejaPasarTank() = false
	
	method dejaPasarBala() = true
	
	method fueImpactado(bala){
		if(not quienDisparo.esEnemiga() and not bala.quienDisparo().esEnemiga()){
			
		} else { //Remueve bala y balaEnemiga cuando chocan
			self.remover() 
			bala.remover() 
		}
	}
	
	method fueColosionadoPorTank(){
		
	}
	
	method contarKill(){
		quienDisparo.aumentarKill()
	}
}

