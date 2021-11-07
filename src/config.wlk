import wollok.game.*
import crearCosas.*
import bloques.*
import tanques.*
import movimientos.*
import escenas.*


object config{
	
	method global(nivel) {
	
	//	TECLADO
		self.teclado()	
	
	//	VISUALES
		self.crearLimites()
				
		nivel.crearMapa()
		
		game.addVisual(score)
		game.addVisual(tank)
		game.addVisual(aguila)
		self.crearEnemigos()
	
		game.onCollideDo(tank, {algo => algo.colisionoConTank()}) //dice cuando gano
		

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
		game.clear()
		gameOver.crearMapa()    
		keyboard.enter().onPressDo { game.stop()}    
		//musica y acaba juego
	}
	
	method win(){
		game.stop()
		//musica y acaba juego
	}
	
	/* ACA DEJO EL SONIDO
 //	SONIDO
	const music = game.sound("ufoInvasion.mp3")
	music.shouldLoop(true)
	keyboard.shift().onPressDo({music.pause()})
	keyboard.control().onPressDo({music.resume()})
	game.schedule(500, {music.play()})
	
	 */
}
