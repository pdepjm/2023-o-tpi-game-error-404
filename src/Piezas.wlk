import wollok.game.*

class Pieza{
	
	var property position=game.at(3.8,10)
	var letra
	
	method image() =letra+".png"
	
	
	method moverIzquierda(){
		self.position(position.left(1))
	}
	
	method moverDerecha(){
		self.position(position.right(1))
	}
	
	method moverAbajo(){
		self.position(position.down(1))
	}
	
	method moverArriba(){
		self.position(position.up(1))
	}
	
		
}

const letras=["L","I","J","O","S","T","Z"]


object paleta {
	
 	const imagenes=["I.png","J.png","L.png","O.png","S.png","T.png","Z.png"]
 	
  	method obtenerImagen()= imagenes.anyOne()
 }