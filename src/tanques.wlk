import wollok.game.*
import movimientos.*
import bloques.*

class Tanques{
	method mover(donde){
		if(donde.puedeMoverse(self)) self.position(donde.position(self))
		self.image(donde.imagen(self)) 
	}
	
	method position(unaPosicion) //definido en el objeto
	method image(unaImagen) //definidos en el objeto
	
	method dejaPasar() = false
}

object tank inherits Tanques{
	const property baseImg = "tank"
	var property image = "tankUp.png"
	var property position = game.origin()
	
}

class TankEnemigo inherits Tanques{
	const property baseImg = "tankEnemigo"
	var property image = "tankEnemigoUp.png"
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia

}

class Bala{
	const property image = "bala.png"
	
	method remover(){game.removeVisual(self)}
}