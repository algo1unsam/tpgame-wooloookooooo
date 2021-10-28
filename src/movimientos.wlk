import wollok.game.*
import tanques.*
import bloques.*

object up{
	const agregado = "Up"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().up(1)) //defino los objetos de arriba
		 return objetos.all({unBloque=> unBloque.dejaPasar()})
	}
	method position(alguien) = alguien.position().up(1)
	method imagen(alguien) = alguien.baseImg()+agregado+".png"
}

object down{
	const agregado = "Down"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().down(1)) //defino los objetos de abajo
		 return objetos.all({unBloque=> unBloque.dejaPasar()})
	}
	method position(alguien) = alguien.position().down(1)
	method imagen(alguien) = alguien.baseImg()+agregado+".png"
}

object left{
	const agregado = "Left"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().left(1)) //defino los objetos de izquierda
		 return objetos.all({unBloque=> unBloque.dejaPasar()})
	}
	method position(alguien) = alguien.position().left(1)
	method imagen(alguien) = alguien.baseImg()+agregado+".png"
}

object right{
	const agregado = "Right"
	
	method puedeMoverse(alguien){
		 const objetos = game.getObjectsIn(alguien.position().right(1)) //defino los objetos de derecha
		 return objetos.all({unBloque=> unBloque.dejaPasar()})
	}
	method position(alguien) = alguien.position().right(1)
	method imagen(alguien) = alguien.baseImg()+agregado+".png"
}
