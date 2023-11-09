import wollok.game.*
import tablero.*

const colores = ["Amarillo","Azul","Rojo","Verde","Violeta","Celeste","Naranja"]


class Bloque{ //cada cuadradito
	
	var property position
	var property image
	
	var posRelativa
	
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
	method borrar(){
		game.removeVisual(self)
	}
	
	method comprobarColision(){
		/*Primero probar que pueda coocarse y luego colocarlo */
		//game.whenCollideDo(self,{x=>tablero.moverArriba() tablero.colocarPieza()})
	}
	
	//-1 rota aizq, 1 rota a der
	method cambiarPos(n){
		const xAnt = posRelativa.head()
		const yAnt = posRelativa.last()
		const xActual =yAnt *n
		const yActual = -xAnt *n
		posRelativa =[xActual,yActual]
		self.cambiarPosReal(-xAnt + xActual,-yAnt + yActual)
		}
	
		
	method cambiarPosReal(x,y){
		position = game.at(position.x() + x, position.y() + y)
	}
}

class Pieza{
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	
	const bloques=[]
	
	method agregarBloques()
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
	}
	
	method moverAbajo(){
		bloques.forEach({bloque => bloque.moverAbajo()})
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
	}
	
	method rotarDerecha(){
		bloques.forEach({bloque => bloque.cambiarPos(1)})
	}
	
	method rotarIzquierda(){
		bloques.forEach({bloque => bloque.cambiarPos(-1)})
	}
	
	method ubicaciones() {
		return bloques.map({bloque => bloque.position()})
	}
	
	
	method bloques() = bloques
	
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
	}
	
}

class L inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y+2), image= imagen, posRelativa = [0,2]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen , posRelativa = [0,1]))
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		bloques.add(new Bloque(position=game.at(x+1,y), image= imagen, posRelativa = [1,0]))
	}
}

class J inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y+2), image= imagen, posRelativa = [0,2]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen, posRelativa = [0,1]))
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		bloques.add(new Bloque(position=game.at(x-1,y), image= imagen, posRelativa = [-1,0]))
	}
		
}

class I inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y-2), image= imagen, posRelativa = [0,-2]))
		bloques.add(new Bloque(position=game.at(x,y-1), image= imagen, posRelativa = [0,-1]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen, posRelativa = [0,1]))
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		
	}
	
}

class O inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x+1,y+1), image= imagen, posRelativa = [1,1]))
		bloques.add(new Bloque(position=game.at(x+1,y), image= imagen, posRelativa = [1,0]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen, posRelativa = [0,1]))
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		
	}	
	
	override method rotarDerecha(){}
	
	override method rotarIzquierda(){}

}

class S inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		bloques.add(new Bloque(position=game.at(x,y-1), image= imagen, posRelativa = [0,-1]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen, posRelativa = [0,1])) 
		bloques.add(new Bloque(position=game.at(x+1,y+1), image= imagen, posRelativa = [1,1]))
	}	

}

class Z inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		bloques.add(new Bloque(position=game.at(x+1,y), image= imagen, posRelativa = [1,0]))
		bloques.add(new Bloque(position=game.at(x,y+1), image= imagen, posRelativa = [0,1])) 
		bloques.add(new Bloque(position=game.at(x-1,y+1), image= imagen, posRelativa = [-1,1]))
	}	
	
}

class T inherits Pieza{	
	
	override method agregarBloques(){
		bloques.add(new Bloque(position=game.at(x,y), image= imagen, posRelativa = [0,0]))
		bloques.add(new Bloque(position=game.at(x,y-1), image= imagen, posRelativa = [0,-1]))
		bloques.add(new Bloque(position=game.at(x+1,y), image= imagen, posRelativa = [1,0])) 
		bloques.add(new Bloque(position=game.at(x-1,y), image= imagen, posRelativa = [-1,0]))
	}
	
}