import wollok.game.*
import crearCosas.*
import bloques.*
import tanques.*
import movimientos.*
import mapas.*


object config{
	
	method global() {
	
	//	TECLADO
		self.teclado()	
	
	//	VISUALES
		self.crearLimites()
				
		mapaNivel1.crearMapa()
		
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
		creadorDeCosas.crear(new Ladrillo(),1,18)
		creadorDeCosas.crear(new Ladrillo(),1,17)
		creadorDeCosas.crear(new Ladrillo(),1,16)
		creadorDeCosas.crear(new Ladrillo(),1,15)
		creadorDeCosas.crear(new Ladrillo(),1,14)
	    creadorDeCosas.crear(new Ladrillo(),3,18)
	    creadorDeCosas.crear(new Ladrillo(),4,18)
	    creadorDeCosas.crear(new Ladrillo(),2,18)
	    creadorDeCosas.crear(new Ladrillo(),2,14)
	    creadorDeCosas.crear(new Ladrillo(),3,14)
	    creadorDeCosas.crear(new Ladrillo(),4,14)
	    creadorDeCosas.crear(new Ladrillo(),4,15)
	    creadorDeCosas.crear(new Ladrillo(),4,16)
	    creadorDeCosas.crear(new Ladrillo(),3,16)
		creadorDeCosas.crear(new Ladrillo(),7,18)
		creadorDeCosas.crear(new Ladrillo(),7,17)
		creadorDeCosas.crear(new Ladrillo(),7,16)
		creadorDeCosas.crear(new Ladrillo(),7,15)
		creadorDeCosas.crear(new Ladrillo(),7,14)
		creadorDeCosas.crear(new Ladrillo(),10,18)
		creadorDeCosas.crear(new Ladrillo(),10,17)
		creadorDeCosas.crear(new Ladrillo(),10,16)
		creadorDeCosas.crear(new Ladrillo(),10,15)
		creadorDeCosas.crear(new Ladrillo(),10,14)
		creadorDeCosas.crear(new Ladrillo(),9,18)
		creadorDeCosas.crear(new Ladrillo(),8,18)
		creadorDeCosas.crear(new Ladrillo(),9,16)
		creadorDeCosas.crear(new Ladrillo(),8,16)
		creadorDeCosas.crear(new Ladrillo(),13,18)
		creadorDeCosas.crear(new Ladrillo(),13,17)
		creadorDeCosas.crear(new Ladrillo(),13,16)
		creadorDeCosas.crear(new Ladrillo(),13,15)
		creadorDeCosas.crear(new Ladrillo(),13,14)
        creadorDeCosas.crear(new Ladrillo(),14,17)
        creadorDeCosas.crear(new Ladrillo(),15,16)
        creadorDeCosas.crear(new Ladrillo(),16,17)
        creadorDeCosas.crear(new Ladrillo(),17,18)
		creadorDeCosas.crear(new Ladrillo(),17,17)
		creadorDeCosas.crear(new Ladrillo(),17,16)
		creadorDeCosas.crear(new Ladrillo(),17,15)
		creadorDeCosas.crear(new Ladrillo(),17,14)
		creadorDeCosas.crear(new Ladrillo(),20,18)
		creadorDeCosas.crear(new Ladrillo(),20,17)
		creadorDeCosas.crear(new Ladrillo(),20,16)
		creadorDeCosas.crear(new Ladrillo(),20,15)
		creadorDeCosas.crear(new Ladrillo(),20,14)
		creadorDeCosas.crear(new Ladrillo(),21,18)
		creadorDeCosas.crear(new Ladrillo(),22,18)
		creadorDeCosas.crear(new Ladrillo(),23,18)
		creadorDeCosas.crear(new Ladrillo(),21,16)
		creadorDeCosas.crear(new Ladrillo(),22,16)
		creadorDeCosas.crear(new Ladrillo(),23,16)
        creadorDeCosas.crear(new Ladrillo(),21,14)
        creadorDeCosas.crear(new Ladrillo(),22,14)
        creadorDeCosas.crear(new Ladrillo(),23,14)
        creadorDeCosas.crear(new Ladrillo(),1,2)
		creadorDeCosas.crear(new Ladrillo(),1,3)
		creadorDeCosas.crear(new Ladrillo(),1,4)
		creadorDeCosas.crear(new Ladrillo(),1,5)
		creadorDeCosas.crear(new Ladrillo(),1,6)
		creadorDeCosas.crear(new Ladrillo(),2,2)
		creadorDeCosas.crear(new Ladrillo(),3,2)
	    creadorDeCosas.crear(new Ladrillo(),4,2)
		creadorDeCosas.crear(new Ladrillo(),4,3)
		creadorDeCosas.crear(new Ladrillo(),4,4)
		creadorDeCosas.crear(new Ladrillo(),4,5)
		creadorDeCosas.crear(new Ladrillo(),4,6)
		creadorDeCosas.crear(new Ladrillo(),3,6)
		creadorDeCosas.crear(new Ladrillo(),2,6)
		creadorDeCosas.crear(new Ladrillo(),4,6)
		creadorDeCosas.crear(new Ladrillo(),7,6)
		creadorDeCosas.crear(new Ladrillo(),7,5)
		creadorDeCosas.crear(new Ladrillo(),7,4)
		creadorDeCosas.crear(new Ladrillo(),8,3)
		creadorDeCosas.crear(new Ladrillo(),9,2)
		creadorDeCosas.crear(new Ladrillo(),10,3)
		creadorDeCosas.crear(new Ladrillo(),11,4)
		creadorDeCosas.crear(new Ladrillo(),11,5)
		creadorDeCosas.crear(new Ladrillo(),11,6)
		creadorDeCosas.crear(new Ladrillo(),14,2)
		creadorDeCosas.crear(new Ladrillo(),14,3)
		creadorDeCosas.crear(new Ladrillo(),14,4)
		creadorDeCosas.crear(new Ladrillo(),14,5)
		creadorDeCosas.crear(new Ladrillo(),14,6)
		creadorDeCosas.crear(new Ladrillo(),15,6)
		creadorDeCosas.crear(new Ladrillo(),16,6)
		creadorDeCosas.crear(new Ladrillo(),17,6)
		creadorDeCosas.crear(new Ladrillo(),15,4)
		creadorDeCosas.crear(new Ladrillo(),16,4)
		creadorDeCosas.crear(new Ladrillo(),17,4)
                creadorDeCosas.crear(new Ladrillo(),15,2)
                creadorDeCosas.crear(new Ladrillo(),16,2)
                creadorDeCosas.crear(new Ladrillo(),17,2)
                creadorDeCosas.crear(new Ladrillo(),20,2)
		creadorDeCosas.crear(new Ladrillo(),20,3)
		creadorDeCosas.crear(new Ladrillo(),20,4)
		creadorDeCosas.crear(new Ladrillo(),20,5)
		creadorDeCosas.crear(new Ladrillo(),20,6)
		creadorDeCosas.crear(new Ladrillo(),21,6)
		creadorDeCosas.crear(new Ladrillo(),22,6)
		creadorDeCosas.crear(new Ladrillo(),23,6)
		creadorDeCosas.crear(new Ladrillo(),23,5)
		creadorDeCosas.crear(new Ladrillo(),23,4)
		creadorDeCosas.crear(new Ladrillo(),22,4)
		creadorDeCosas.crear(new Ladrillo(),21,4)
		creadorDeCosas.crear(new Ladrillo(),20,6)
		creadorDeCosas.crear(new Ladrillo(),23,2)
		creadorDeCosas.crear(new Ladrillo(),22,3)    
		
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
