import wollok.game.*
import tanques.*
import movimientos.*
import bloques.*

object config{
	
	method ejecutar(){
//	VISUALES

	game.addVisual(tank)
	creadorDeCosas.crear(new TankEnemigo(), 10, 10)
	//agrego los limites y uso el bloque de acero que no se puede atravesar ni romper.
	game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,-1) }) //limite abajo
	game.width().times({t => creadorDeCosas.crear(new Acero(),t-1,game.height()) }) //limite arriba
	game.height().times({t => creadorDeCosas.crear(new Acero(),-1,t-1) }) //limite izquierda
	game.height().times({t => creadorDeCosas.crear(new Acero(),game.width(),t-1) }) //limite derecha
	
	creadorDeCosas.crear(new Ladrillo(),5,5)
	creadorDeCosas.crear(new Acero(),10,5)
	
//	TECLADO

	keyboard.up().onPressDo { tank.mover(up)}
	keyboard.down().onPressDo { tank.mover(down) }
	keyboard.left().onPressDo { tank.mover(left) }
	keyboard.right().onPressDo { tank.mover(right) }
	keyboard.a().onPressDo { tank.disparo() }
	
	/* verifica q se mueva el tank enemigo (antes instanciar tankEnemigo con creadorDeCosas)
	keyboard.w().onPressDo { tankEnemigo.mover(up)}
	keyboard.s().onPressDo { tankEnemigo.mover(down) }
	keyboard.a().onPressDo { tankEnemigo.mover(left) }
	keyboard.d().onPressDo { tankEnemigo.mover(right) }
	*/
	}
}
