import wollok.game.*
import movimientos.*
import bloques.*

object creadorDeCosas{
	method crear(cosa,x,y){
		game.addVisualIn(cosa, game.at(x,y))
		cosa.position(game.at(x,y))
	} 
}

class Tanques{
	var property dondeMira = up
	method mover(donde){
		if(donde.puedeMoverse(self)) self.position(donde.position(self))
		self.image(donde.imagen(self)) 
		self.dondeMira(donde)
	}

	method position()
	method position(unaPosicion) //definido en el objeto
	method image(unaImagen) //definidos en el objeto
	
	method dejaPasar() = false
	
	method remover() {game.removeVisual(self)}
}

object tank inherits Tanques{
	const property baseImg = "tank"
	var property image = "tankUp.png"
	var property position = game.origin()
	
	method disparo(){
		const bala = new Bala(sentido = self.dondeMira(), position = self.dondeMira().position(self), quienDisparo = self)
		bala.disparar()
	}
	
	method fueImpactado(bala){
		//vacio
	}
	
	method fueImpactadoPorEnemigo (bala){
		//PERDER
		bala.remover()
	}
}

class TankEnemigo inherits Tanques{
	const property baseImg = "tankEnemigo"
	var property image = "tankEnemigoUp.png"
	var property position = game.origin() //no importa la posicion pq se modifica cuando se intancia

	method fueImpactado(bala){
		self.remover()
		bala.remover()
	}
	
	method disparo(){
		const balaEnemiga = new BalaEnemiga(sentido = self.dondeMira(), position = self.dondeMira().position(self), quienDisparo = self)
		balaEnemiga.disparar()
	}
	
	method fueImpactadoPorEnemigo (bala){
		//nada
	}
}

class Bala{
	const property quienDisparo
	const property sentido 
	var property position
	
	method image () = "bala"+ sentido.agregado() +".png"
	
	method remover() {game.removeVisual(self)}
	
	method mover(){
		self.position(sentido.position(self))
	}
	
	method disparar() {
		game.addVisual(self)
		game.onTick(20000, "bala"+self.identity().toString()+"disparada",{ self.mover() })
		self.choco()
	}
	
	method choco(){
		game.whenCollideDo(self, {cosa => cosa.fueImpactado(self)})
	}
	
	method dejaPasar(){
		//vacio
	}
	
	method fueImpactado(bala){
		//vacio
	}
	
	method fueImpactadoPorEnemigo (bala){
		self.remover()
		bala.remover()
	}
}

class BalaEnemiga inherits Bala{
	override method disparar(){
		game.addVisual(self)
		game.onTick(20000, "balaEnemiga"+self.identity().toString()+"disparada",{ self.mover() })
		self.choco()
	}
	
	override method choco(){
		game.whenCollideDo(self, {cosa => cosa.fueImpactadoPorEnemigo(self)})
	}
	
	override method fueImpactadoPorEnemigo(bala){
		//vacio
	}
	
	override method fueImpactado (bala){
		self.remover()
		bala.remover()
	}
}
