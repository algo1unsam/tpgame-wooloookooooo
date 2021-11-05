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
		
		
		game.onCollideDo(tank, {algo => algo.colisionoConTank()}) //dice cuando gano
		
		self.crearMapa()
		
		game.addVisual(score)
		
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
		//ladrillos
		creadorDeCosas.crear(new Ladrillo(),0,19)
		creadorDeCosas.crear(new Ladrillo(),4,19)
		creadorDeCosas.crear(new Ladrillo(),5,19)
		creadorDeCosas.crear(new Ladrillo(),11,19)
		creadorDeCosas.crear(new Ladrillo(),13,19)
		creadorDeCosas.crear(new Ladrillo(),17,19)
		creadorDeCosas.crear(new Ladrillo(),23,19)
		creadorDeCosas.crear(new Ladrillo(),0,18)
		creadorDeCosas.crear(new Ladrillo(),5,18)
		creadorDeCosas.crear(new Ladrillo(),6,18)
		creadorDeCosas.crear(new Ladrillo(),11,18)
		creadorDeCosas.crear(new Ladrillo(),12,18)
		creadorDeCosas.crear(new Ladrillo(),13,18)
		creadorDeCosas.crear(new Ladrillo(),19,18)
		creadorDeCosas.crear(new Ladrillo(),24,18)
		creadorDeCosas.crear(new Ladrillo(),5,17)
		creadorDeCosas.crear(new Ladrillo(),6,17)
		creadorDeCosas.crear(new Ladrillo(),1,16)
		creadorDeCosas.crear(new Ladrillo(),4,16)
		creadorDeCosas.crear(new Ladrillo(),5,16)
		creadorDeCosas.crear(new Ladrillo(),17,16)
		creadorDeCosas.crear(new Ladrillo(),20,16)
		creadorDeCosas.crear(new Ladrillo(),23,16)
		creadorDeCosas.crear(new Ladrillo(),1,15)
		creadorDeCosas.crear(new Ladrillo(),16,15)
		creadorDeCosas.crear(new Ladrillo(),21,15)
		creadorDeCosas.crear(new Ladrillo(),22,15)
		creadorDeCosas.crear(new Ladrillo(),10,14)
		creadorDeCosas.crear(new Ladrillo(),22,14)
		creadorDeCosas.crear(new Ladrillo(),6,13)
		creadorDeCosas.crear(new Ladrillo(),7,13)
		creadorDeCosas.crear(new Ladrillo(),13,13)
		creadorDeCosas.crear(new Ladrillo(),20,13)
		creadorDeCosas.crear(new Ladrillo(),23,13)
		creadorDeCosas.crear(new Ladrillo(),2,11)
		creadorDeCosas.crear(new Ladrillo(),5,11)
		creadorDeCosas.crear(new Ladrillo(),6,11)
		creadorDeCosas.crear(new Ladrillo(),14,11)
		creadorDeCosas.crear(new Ladrillo(),22,11)
		creadorDeCosas.crear(new Ladrillo(),0,10)
		creadorDeCosas.crear(new Ladrillo(),17,10)
		creadorDeCosas.crear(new Ladrillo(),12,8)
		creadorDeCosas.crear(new Ladrillo(),11,7)
		creadorDeCosas.crear(new Ladrillo(),14,7)
		creadorDeCosas.crear(new Ladrillo(),1,6)
		creadorDeCosas.crear(new Ladrillo(),2,6)
		creadorDeCosas.crear(new Ladrillo(),14,6)
		creadorDeCosas.crear(new Ladrillo(),21,6)
		creadorDeCosas.crear(new Ladrillo(),22,6)
		creadorDeCosas.crear(new Ladrillo(),23,6)
		creadorDeCosas.crear(new Ladrillo(),5,5)
		creadorDeCosas.crear(new Ladrillo(),6,5)
		creadorDeCosas.crear(new Ladrillo(),14,5)
		creadorDeCosas.crear(new Ladrillo(),23,5)
		creadorDeCosas.crear(new Ladrillo(),5,4)
		creadorDeCosas.crear(new Ladrillo(),7,4)
		creadorDeCosas.crear(new Ladrillo(),0,3)
		creadorDeCosas.crear(new Ladrillo(),1,3)
		creadorDeCosas.crear(new Ladrillo(),6,3)
		creadorDeCosas.crear(new Ladrillo(),7,3)
		creadorDeCosas.crear(new Ladrillo(),18,3)
		creadorDeCosas.crear(new Ladrillo(),20,3)
		creadorDeCosas.crear(new Ladrillo(),2,2)
		creadorDeCosas.crear(new Ladrillo(),7,2)
		creadorDeCosas.crear(new Ladrillo(),9,2)
		creadorDeCosas.crear(new Ladrillo(),17,2)
		creadorDeCosas.crear(new Ladrillo(),19,2)
		creadorDeCosas.crear(new Ladrillo(),20,2)
		creadorDeCosas.crear(new Ladrillo(),2,1)
		creadorDeCosas.crear(new Ladrillo(),10,1)
		creadorDeCosas.crear(new Ladrillo(),2,0)
		creadorDeCosas.crear(new Ladrillo(),9,0)
		creadorDeCosas.crear(new Ladrillo(),16,0)
		
		//arbustos
		creadorDeCosas.crear(new Arbusto(),9,19)
		creadorDeCosas.crear(new Arbusto(),10,19)
		creadorDeCosas.crear(new Arbusto(),14,19)
		creadorDeCosas.crear(new Arbusto(),9,18)
		creadorDeCosas.crear(new Arbusto(),10,18)
		creadorDeCosas.crear(new Arbusto(),14,18)
		creadorDeCosas.crear(new Arbusto(),2,17)
		creadorDeCosas.crear(new Arbusto(),9,17)
		creadorDeCosas.crear(new Arbusto(),10,17)
		creadorDeCosas.crear(new Arbusto(),14,17)
		creadorDeCosas.crear(new Arbusto(),9,16)
		creadorDeCosas.crear(new Arbusto(),10,16)
		creadorDeCosas.crear(new Arbusto(),11,16)
		creadorDeCosas.crear(new Arbusto(),12,16)
		creadorDeCosas.crear(new Arbusto(),13,16)
		creadorDeCosas.crear(new Arbusto(),14,16)
		creadorDeCosas.crear(new Arbusto(),14,14)
		creadorDeCosas.crear(new Arbusto(),3,13)
		creadorDeCosas.crear(new Arbusto(),10,13)
		creadorDeCosas.crear(new Arbusto(),19,13)
		creadorDeCosas.crear(new Arbusto(),20,12)
		creadorDeCosas.crear(new Arbusto(),7,11)
		creadorDeCosas.crear(new Arbusto(),10,11)
		creadorDeCosas.crear(new Arbusto(),11,11)
		creadorDeCosas.crear(new Arbusto(),10,10)
		creadorDeCosas.crear(new Arbusto(),11,10)
		creadorDeCosas.crear(new Arbusto(),14,9)
		9.times({t => creadorDeCosas.crear(new Arbusto(),t-1,8)})
		11.times({t => creadorDeCosas.crear(new Arbusto(),t+13,8)})
		creadorDeCosas.crear(new Arbusto(),16,7)
		creadorDeCosas.crear(new Arbusto(),16,6)
		creadorDeCosas.crear(new Arbusto(),16,5)
		creadorDeCosas.crear(new Arbusto(),18,5)
		creadorDeCosas.crear(new Arbusto(),16,4)
		creadorDeCosas.crear(new Arbusto(),22,4)
		creadorDeCosas.crear(new Arbusto(),12,2)
		creadorDeCosas.crear(new Arbusto(),19,1)
		creadorDeCosas.crear(new Arbusto(),12,0)
		
		//acero
		creadorDeCosas.crear(new Acero(),15,19)
		creadorDeCosas.crear(new Acero(),15,18)
		creadorDeCosas.crear(new Acero(),15,17)
		creadorDeCosas.crear(new Acero(),15,16)
		13.times({t => creadorDeCosas.crear(new Acero(),t+1,15)})
		creadorDeCosas.crear(new Acero(),18,15)
		creadorDeCosas.crear(new Acero(),19,15)
		creadorDeCosas.crear(new Acero(),2,14)
		creadorDeCosas.crear(new Acero(),3,14)
		creadorDeCosas.crear(new Acero(),4,14)
		creadorDeCosas.crear(new Acero(),18,14)
		creadorDeCosas.crear(new Acero(),21,14)
		creadorDeCosas.crear(new Acero(),2,13)
		creadorDeCosas.crear(new Acero(),18,13)
		creadorDeCosas.crear(new Acero(),6,12)
		10.times({t => creadorDeCosas.crear(new Acero(),t+8,12)})
		creadorDeCosas.crear(new Acero(),9,11)
		creadorDeCosas.crear(new Acero(),9,10)
		creadorDeCosas.crear(new Acero(),9,8)
		creadorDeCosas.crear(new Acero(),9,7)
		creadorDeCosas.crear(new Acero(),9,6)
		creadorDeCosas.crear(new Acero(),18,6)
		creadorDeCosas.crear(new Acero(),9,5)
		creadorDeCosas.crear(new Acero(),6,4)
		creadorDeCosas.crear(new Acero(),9,4)
		creadorDeCosas.crear(new Acero(),2,3)
		9.times({t => creadorDeCosas.crear(new Acero(),t+8,3)})
		creadorDeCosas.crear(new Acero(),19,3)
		creadorDeCosas.crear(new Acero(),18,2)
		creadorDeCosas.crear(new Acero(),9,1)
		
		//agua
		
		creadorDeCosas.crear(new Agua(),2,18)
		creadorDeCosas.crear(new Agua(),3,18)
		creadorDeCosas.crear(new Agua(),7,18)
		creadorDeCosas.crear(new Agua(),7,17)
		creadorDeCosas.crear(new Agua(),21,17)
		creadorDeCosas.crear(new Agua(),22,17)
		creadorDeCosas.crear(new Agua(),21,16)
		creadorDeCosas.crear(new Agua(),21,16)
		creadorDeCosas.crear(new Agua(),3,12)
		creadorDeCosas.crear(new Agua(),3,11)
		10.times({t=> creadorDeCosas.crear(new Agua(),t-1,9)})
		10.times({t=> creadorDeCosas.crear(new Agua(),t+14,9)})
		creadorDeCosas.crear(new Agua(),12,7)
		creadorDeCosas.crear(new Agua(),11,6)
		creadorDeCosas.crear(new Agua(),12,6)
		creadorDeCosas.crear(new Agua(),14,4)
		creadorDeCosas.crear(new Agua(),21,3)
		creadorDeCosas.crear(new Agua(),4,2)
		creadorDeCosas.crear(new Agua(),21,2)
		creadorDeCosas.crear(new Agua(),4,1)
		creadorDeCosas.crear(new Agua(),13,1)
		creadorDeCosas.crear(new Agua(),14,1)
		
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
