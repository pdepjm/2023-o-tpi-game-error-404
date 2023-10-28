import wollok.game.*
import tablero.*

const colores = ["Amarillo","Azul","Rojo","Verde","Violeta","Celeste","Naranja"]


class Bloque{ //cada cuadradito
	
	var property position
	var property image
	
	method moverIzquierda(){
		self.position(position.left(1))
	}
	
	method moverDerecha(){
		self.position(position.right(1))
	}
	
	method moverAbajo(){
		game.whenCollideDo(self,{x=>tablero.moverArriba() tablero.colocarPieza()})
		self.position(position.down(1))
	}
	
	method moverArriba(){
		self.position(position.up(1))
	}
}

class L{	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	const ubicaciones = []
	const bloques = [new Bloque(position=game.at(x,y+2), image= imagen),
		new Bloque(position=game.at(x,y+1), image= imagen),
		new Bloque(position=game.at(x,y), image= imagen), 
		new Bloque(position=game.at(x+1,y), image= imagen)
	]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
		
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 2
		}
		else if(rotacion == 2){
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 3
		}
		else if(rotacion == 3){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		if(rotacion == 1){
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 0
		}
		else if(rotacion == 2){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 3){
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 2
		}
		else if(rotacion == 0){
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 3
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
		
	}
}

class J{	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	const ubicaciones = []
	const bloques = [new Bloque(position=game.at(x,y+2), image= imagen),
		new Bloque(position=game.at(x,y+1), image= imagen),
		new Bloque(position=game.at(x,y), image= imagen), 
		new Bloque(position=game.at(x-1,y), image= imagen)]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
		
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 2
		}
		else if(rotacion == 2){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 3
		}
		else if(rotacion == 3){
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		if(rotacion == 1){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 0
		}
		else if(rotacion == 2){
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 3){
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 2
		}
		else if(rotacion == 0){
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 3
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
		
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
		
	}
}


class I{	
	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	
	const ubicaciones = []
	
	const bloques = [new Bloque(position=game.at(x,y+3), image= imagen),
		new Bloque(position=game.at(x,y+2), image= imagen),
		new Bloque(position=game.at(x,y+1), image= imagen), 
		new Bloque(position=game.at(x,y), image= imagen)
	]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){

		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
		
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(1).moverDerecha()
			bloques.get(1).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(2).moverArriba()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(1).moverIzquierda()
			bloques.get(1).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(2).moverIzquierda()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		if(rotacion == 1){
			bloques.get(1).moverIzquierda()
			bloques.get(1).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(2).moverIzquierda()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverAbajo()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverIzquierda()
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			rotacion = 0
		}
		else if(rotacion == 0){
			bloques.get(1).moverDerecha()
			bloques.get(1).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(2).moverArriba()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverDerecha()
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			rotacion = 1
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
	}
}

class O{	
	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	
	const ubicaciones = []
	
	const bloques = [new Bloque(position=game.at(x+1,y+1), image= imagen),
		new Bloque(position=game.at(x+1,y), image= imagen),
		new Bloque(position=game.at(x,y+1), image= imagen), 
		new Bloque(position=game.at(x,y), image= imagen)
	]
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
		
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){}
	
	method rotarIzquierda(){}
	
	method ubicaciones() = ubicaciones
	
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
	}
}

class S{	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	const ubicaciones = []
	const bloques = [new Bloque(position=game.at(x,y), image= imagen),
		new Bloque(position=game.at(x+1,y), image= imagen),
		new Bloque(position=game.at(x+1,y+1), image= imagen), 
		new Bloque(position=game.at(x+2,y+1), image= imagen)]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverAbajo()
			bloques.get(1).moverAbajo()
			bloques.get(1).moverDerecha()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(3).moverArriba()
			bloques.get(3).moverArriba()
			bloques.get(1).moverArriba()
			bloques.get(1).moverIzquierda()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverIzquierda()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		self.rotarDerecha()
	}
		
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true	
	}
}

class Z{	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	const ubicaciones = []
	const bloques = [new Bloque(position=game.at(x,y), image= imagen),
		new Bloque(position=game.at(x+1,y), image= imagen),
		new Bloque(position=game.at(x+1,y-1), image= imagen), 
		new Bloque(position=game.at(x+2,y-1), image= imagen)]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverIzquierda()
			bloques.get(1).moverAbajo()
			bloques.get(1).moverDerecha()
			bloques.get(0).moverDerecha()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(3).moverArriba()
			bloques.get(3).moverDerecha()
			bloques.get(1).moverIzquierda()
			bloques.get(1).moverArriba()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverIzquierda()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		self.rotarDerecha()
	}
	
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
	}
}
class T{	
	var x
	var y
	const imagen= "Bloque"+colores.anyOne()+".png"
	const ubicaciones = []
	const bloques = [new Bloque(position=game.at(x,y), image= imagen),
		new Bloque(position=game.at(x,y-1), image= imagen),
		new Bloque(position=game.at(x-1,y-1), image= imagen), 
		new Bloque(position=game.at(x+1,y-1), image= imagen)]
	
	//0 es q no roto, a la derecha suma 1, a la izquierda resta
	var rotacion = 0 
	
	method agregarVisuales(){
		bloques.forEach({bloque => game.addVisual(bloque)})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverDerecha(){
		bloques.forEach({bloque => bloque.moverDerecha()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverIzquierda(){
		bloques.forEach({bloque => bloque.moverIzquierda()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method moverAbajo(){
		
		bloques.forEach({bloque => bloque.moverAbajo()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
		
	}
	
	method moverArriba(){
		bloques.forEach({bloque => bloque.moverArriba()})
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarDerecha(){
		if(rotacion == 0){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 1){
			bloques.get(3).moverArriba()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 2
		}
		else if(rotacion == 2){
			bloques.get(3).moverArriba()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 3
		}
		else if(rotacion == 3){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 0
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
	
	method rotarIzquierda(){
		if(rotacion == 1){
			bloques.get(3).moverArriba()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverArriba()
			rotacion = 0
		}
		else if(rotacion == 2){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverDerecha()
			bloques.get(2).moverArriba()
			bloques.get(2).moverIzquierda()
			bloques.get(0).moverArriba()
			bloques.get(0).moverDerecha()
			rotacion = 1
		}
		else if(rotacion == 3){
			bloques.get(3).moverAbajo()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverArriba()
			bloques.get(2).moverDerecha()
			bloques.get(0).moverAbajo()
			bloques.get(0).moverDerecha()
			rotacion = 2
		}
		else if(rotacion == 0){
			bloques.get(3).moverArriba()
			bloques.get(3).moverIzquierda()
			bloques.get(2).moverDerecha()
			bloques.get(2).moverAbajo()
			bloques.get(0).moverIzquierda()
			bloques.get(0).moverAbajo()
			rotacion = 3
		}
		ubicaciones.clear()
		bloques.forEach({bloque => ubicaciones.add(bloque.position())})
	}
		
	method ubicaciones() = ubicaciones
	method noSaleDeTablero(){
		//ver si cuando realizo el movimiento pedido excedo 21 en y o 11 en x
		return true
		
	}
}