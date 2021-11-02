import wollok.game.*
import tanques.*
import bloques.*
import config.*

class Direcciones{
	method imagen(alguien) = alguien.baseImg()+self.agregado()+".png"
	
	method lateral() = false
	
	method agregado()
	
	method position(alguien)
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(self.position(alguien)) //defino los objetos de arriba
		 return objetos.all({unBloque=> unBloque.dejaPasarTank()})
	}
}

object up inherits Direcciones{
	const property agregado = "Up"
	
	override method position(alguien) = alguien.position().up(1)
	
}

object down inherits Direcciones{
	const property agregado = "Down"
	
	override method position(alguien) = alguien.position().down(1)
}

object left inherits Direcciones{
	const property agregado = "Left"
	
	override method lateral() = true
	
	override method position(alguien) = alguien.position().left(1)
}

object right inherits Direcciones{
	const property agregado = "Right"
	
	override method lateral() = true
	
	override method position(alguien) = alguien.position().right(1)
	
}
