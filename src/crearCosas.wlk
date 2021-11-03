import wollok.game.*
import tanques.*
import movimientos.*
import bloques.*
import config.*
import balas.*

object creadorDeCosas{
	method crear(cosa,x,y){
		cosa.position(game.at(x,y))
		game.addVisual(cosa)
	}
	
	method crearTankEnemigo() {
		const x = (1..25).anyOne()
		const y = (1..20).anyOne()
		
		if(game.at(x,y).allElements().size() == 0){
			const nuevoTankEnemigo = new TankEnemigo()
			self.crear(nuevoTankEnemigo, x, y)
			game.onTick(700, nuevoTankEnemigo.nombreOnTick()+"mover", { nuevoTankEnemigo.mover(self.moverRandom()) })
			game.onTick(1000, nuevoTankEnemigo.nombreOnTick()+"disparo", { nuevoTankEnemigo.disparo() })
		} else {
			self.crearTankEnemigo()
		}
	} 
	
	method moverRandom() = [up,down,right,left].anyOne()
	
}

object score{
	method position() = game.at(23,19)
	method text() = "score: " +tank.scoreAsesinados().toString()
	
	method textColor() = "FFFFFF"
	
	method fueImpactadoPorEnemigo(bala){
		//nada 
	}
	
	method fueImpactado(bala){
		//nada 
	}
	
	method dejaPasarTank() = true
	method dejaPasarBala() = true
	method seRompe() = false
	
	method colisionoConTank(){
		//vacio
	}
}
