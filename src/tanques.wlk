import wollok.game.*
import movimientos.*
import bloques.*
import config.*
import crearCosas.*
import balas.*

class Tanque{
	var property dondeMira = up
	
	method mover(donde){
		if(donde.puedeMoverse(self)) self.position(donde.position(self))
			self.image(donde.imagen(self)) 
			self.dondeMira(donde)
	}

	method position(unaPosicion) //definido en el objeto
	method image(unaImagen) //definidos en el objeto
	
	method dejaPasarTank() = false
	
	method dejaPasarBala() = false
	
	method remover() {game.removeVisual(self)}
	
	method esEnemiga() = true
}

object tank inherits Tanque{
	var property scoreAsesinados = 0
	const property baseImg = "tank"
	var property image = "tankUp.png"
	var property position = game.origin()
	
	
	method disparo(){
		const bala = new Bala(sentido = self.dondeMira(), position = self.dondeMira().position(self), quienDisparo = self)
		bala.disparar()
	}

	method fueImpactado (bala){
		if(bala.quienDisparo().esEnemiga()) {
			bala.remover()
			config.gameOver()
		}
	}
	
	method aumentarKill() {
		scoreAsesinados += 100
	}
	
	override method esEnemiga() = false
}

class TankEnemigo inherits Tanque{
	const property baseImg = "tankEnemigo"
	var property image = "tankEnemigoUp.png"
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia
	
	method nombreOnTick() = baseImg+self.identity().toString()
	
	method fueImpactado(bala){
		game.removeTickEvent(self.nombreOnTick()+"mover")
		game.removeTickEvent(self.nombreOnTick()+"disparo")
		self.remover()
		bala.contarKill()
		bala.remover()
	}
	
	method disparo(){
		const bala = new Bala(sentido = self.dondeMira(), position = self.dondeMira().position(self), quienDisparo = self)
		bala.disparar()
	}

	method aumentarKill(){
		//nada
	}
}