import wollok.game.*
import tanques.*
import movimientos.*
import bloques.*
import config.*
import crearCosas.*

class Bala{
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
		//vacio
	}
	
	method fueImpactadoPorEnemigo (bala){
		self.remover()
		bala.remover()
	}
	
	method contarKill(){
		quienDisparo.aumentarKill()
	}
}

class BalaEnemiga inherits Bala{
	override method nombreOnTick() = "balaEnemiga"+self.identity().toString()+" disparada"
	
	override method impacto(){
		game.whenCollideDo(self, {cosa => cosa.fueImpactadoPorEnemigo(self)})
	}
	
	override method fueImpactado(bala){
		//vacio
	}
	
	override method fueImpactadoPorEnemigo (bala){
		self.remover()
		bala.remover()
	}
}

