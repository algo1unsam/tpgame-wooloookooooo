import wollok.game.*

object nave {
	var property position = game.center() //ver donde empezar
	var property image = "nave.png"
	
	method mover(direccion) {
		position = direccion.posicion()
	}
	
	method puedeMoverse(donde){
		if(donde.direccion()){
			if(donde.sentido()){
				return donde.posicion().x() <= game.width()-1
			}else{
				return donde.posicion().x() >= 0
			}
		} else {
			if(donde.sentido()){
				return donde.posicion().y() <= game.height()-1
			}else{
				return donde.posicion().y() >= 0
			}
		}
	}
}

object arriba {
	const property direccion = false
	const property sentido = true
	
	method posicion(){
		return nave.position().up(1) //por ahora tank
	}
		
}

object abajo{
	const property direccion = false
	const property sentido = false
	
	method posicion(){
		return nave.position().down(1) //por ahora tank
	}
	
}

object derecha{
	const property direccion = true
	const property sentido = true
	
	method posicion(){
		return nave.position().right(1) //por ahora tank
	}
	
}

object izquierda{
	const property direccion = true
	const property sentido = false
	
	method posicion(){
		return nave.position().left(1) //por ahora tank
	}
}