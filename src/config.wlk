import wollok.game.*
import tanques.*
import movimientos.*
import bloques.*
import crearCosas.*
import balas.*

object config{
	
	method global(){
//	VISUALES
		self.crearContornoExterior()
		
		game.addVisual(tank)
		game.addVisual(aguila)
		game.addVisual(score)
		
		game.onCollideDo(tank, {algo => algo.colisionoConTank()}) //dice cuando gano
		
		self.crearMapa()
		
		game.onTick(5000, "tanques", {creadorDeCosas.crearTankEnemigo()})
		creadorDeCosas.crear(new Ladrillo(),5,5) //prueba
		creadorDeCosas.crear(new Acero(),10,5)	//prueba	
		creadorDeCosas.crear(new Agua(),15,15) //prueba
		creadorDeCosas.crear(new Arbusto(),7,10) //prueba
		
//	TECLADO
		self.teclado()	
	}
	
	
	method crearContornoExterior(){
		//agrego los limites y uso el bloque de acero que no se puede atravesar ni romper.
		game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,-1) }) //limite abajo
		game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,game.height()) }) //limite arriba
		game.height().times({t => creadorDeCosas.crear(new Acero(),-1,t-1) }) //limite izquierda
		game.height().times({t => creadorDeCosas.crear(new Acero(),game.width(),t-1) }) //limite derecha
	}
	
	method teclado(){
		keyboard.up().onPressDo { tank.mover(up)}
		keyboard.down().onPressDo { tank.mover(down) }
		keyboard.left().onPressDo { tank.mover(left) }
		keyboard.right().onPressDo { tank.mover(right) }
		keyboard.a().onPressDo { tank.disparo() }
	
	}
	
	method crearMapa() {
		//configurar todo el mapa inicial
	}
	
	method gameOver(){
		game.stop()
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
