import wollok.game.*
import crearCosas.*
import bloques.*
import tanques.*
import movimientos.*
import escenas.*


object config {

	var seEjecutoEnter = false //sirve para ejecutar enter 1 sola vez

	method global(nivel) {
	
		game.addVisual(pantallaDeCarga)
		
		keyboard.enter().onPressDo {
			if(not seEjecutoEnter) self.ejecutar(nivel)
		}
	}
	
	method ejecutar(nivel){
		seEjecutoEnter = true
		if(game.hasVisual(pantallaDeCarga)){ 
			game.removeVisual(pantallaDeCarga)
			musica.inicio().shouldLoop(false)	
			musica.inicio().play()
			musica.inicio().volume(0.2)
			musica.musica().shouldLoop(true)	
			musica.musica().play()
			musica.musica().volume(0.2)
	}
		
	//	TECLADO
	self.teclado()	

	//	VISUALES
	self.crearLimites()
				
	nivel.crearMapa()
		
	game.addVisual(score)
	game.addVisual(tank)
	game.addVisual(aguila)
	self.crearEnemigos()
	
	game.onCollideDo(tank, {algo => algo.fueColosionadoPorTank()}) //dice cuando gano
		

	}

	method teclado(){
		keyboard.up().onPressDo { tank.mover(up)}
		keyboard.down().onPressDo { tank.mover(down) }
		keyboard.left().onPressDo { tank.mover(left) }
		keyboard.right().onPressDo { tank.mover(right) }
		keyboard.a().onPressDo { tank.disparo() }
	
	}
	
	method crearLimites(){
		//agrego los limites y uso el bloque de acero que no se puede atravesar ni romper.
		game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,-1) }) //limite abajo
		game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,game.height()) }) //limite arriba
		game.height().times({t => creadorDeCosas.crear(new Acero(),-1,t-1) }) //limite izquierda
		game.height().times({t => creadorDeCosas.crear(new Acero(),game.width(),t-1) }) //limite derecha
	}

	method crearEnemigos() {
		game.onTick(5000, "tanques", {creadorDeCosas.crearTankEnemigo()})
	}
	
	method gameOver(){
		musica.musica().stop()
		game.clear()
		perdio.crearMapa()
		game.addVisual(presioneenter)
		
		keyboard.enter().onPressDo { game.stop()}  
		musica.perder1().shouldLoop(false)	
		musica.perder1().play()
		musica.perder1().volume(0.6)  
		musica.perder2().shouldLoop(false)	
		musica.perder2().play()
		musica.perder2().volume(0.1) 
	}
	
	method win() {
		musica.musica().stop()
		game.clear()
		game.addVisual(ganar)
		keyboard.enter().onPressDo {game.stop()}
		musica.ganar().shouldLoop(true)	
		musica.ganar().play()
		musica.ganar().volume(0.2)
		
	}
	

}
object musica {

	const property musica = game.sound("ticki.mp3")
	const property ganar = game.sound("win.mp3")
	const property perder = game.sound("perder.mp3")
	const property inicio = game.sound("grieta.mp3")
	const property perder1 = game.sound("ashe.mp3")
	const property perder2 = game.sound("no.mp3")
	

}

object ganar {

	method position() = game.origin()

	method image() = "ganaste.png"

	method fueColosionadoPorTank() {
	}

}

object presioneenter {

	method position() = game.at(2, 9)

	method image() = "presioneenter.png"

	method fueColosionadoPorTank() {
	}

}



object pantallaDeCarga {

	method position() = game.origin()

	method image() = "pantalladecarga.png"

	method fueColosionadoPorTank() {}

}
