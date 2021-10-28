import wollok.game.*
import tanques.*
import bloques.*
import config.*

class Direcciones{
	method imagen(alguien) = alguien.baseImg()+self.agregado()+".png"
	
	method lateral() = false
	
	method agregado()
}

object up inherits Direcciones{
	const property agregado = "Up"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().up(1)) //defino los objetos de arriba
		 return objetos.all({unBloque=> unBloque.dejaPasarTank()})
	}
	method position(alguien) = alguien.position().up(1)
	
}

object down inherits Direcciones{
	const property agregado = "Down"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().down(1)) //defino los objetos de abajo
		 return objetos.all({unBloque=> unBloque.dejaPasarTank()})
	}
	method position(alguien) = alguien.position().down(1)
	
}

object left inherits Direcciones{
	const property agregado = "Left"
	
	override method lateral() = true
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().left(1)) //defino los objetos de izquierda
		 return objetos.all({unBloque=> unBloque.dejaPasarTank()})
	}
	method position(alguien) = alguien.position().left(1)
	
}

object right inherits Direcciones{
	const property agregado = "Right"
	
	override method lateral() = true
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().right(1)) //defino los objetos de derecha
		 return objetos.all({unBloque=> unBloque.dejaPasarTank()})
	}
	method position(alguien) = alguien.position().right(1)
	
}
