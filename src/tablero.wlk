import wollok.game.*
import Piezas.*

object tablero {
	
	const bloquesTotales = []
	var pieza = new L(x=5,y=20)
	
	method pieza()= pieza
	
	method iniciar() {
		self.generarPieza()
		game.onTick(800, "movimiento", { self.moverAbajo() })
	}
	
	method moverAbajo() {
		if(!pieza.ubicaciones().any({ubi => ubi.y() == 1})){
			pieza.moverAbajo()
			}else{
				self.colocarPieza()
				
			}
		}
		
	method moverArriba(){
		 pieza.moverArriba()
		 }
		 
	method moverDerecha() {
		if(!pieza.ubicaciones().any({ubi => ubi.x() == 10}))
		 pieza.moverDerecha()
		 }
		 
	method moverIzquierda() {
		if(!pieza.ubicaciones().any({ubi => ubi.x() == 1}))
		 pieza.moverIzquierda()
		 }
		 
	method rotarIzquierda() {
		 pieza.rotarIzquierda()
		 }
		 
	method rotarDerecha() {
		 pieza.rotarDerecha()
		 }
	
	method controlarLinea(listaDeY) {
		console.println("lista  : " + listaDeY)
		listaDeY.forEach({y =>  
			if(bloquesTotales.count({bloque=> bloque.position().y() == y}) == 10){
				//se borra la linea
				console.println("complete la linea: " + y)
				self.borrarLinea(y)
			}
		})
	}
	
	method borrarLinea(linea) {
		const bloquesAEliminar = bloquesTotales.filter({bloque => bloque.position().y() == linea})
		bloquesAEliminar.forEach({bloque => bloque.borrar()})
		bloquesTotales.removeAllSuchThat({bloque => bloquesAEliminar.contains(bloque)})
		self.bajarDesde(linea+1)
	}
	method bajarDesde(linea) {
		bloquesTotales.filter({bloque => bloque.position().y() >= linea}).forEach({bloque => bloque.bajarHastaChocar()})
	}
	
	method colocarPieza(){
		/*if(pieza.ubicaciones().any({ubi => ubicacionesOcupadas.contains(ubi)})){
			//no se puede colocar la pieza

		}else{*/
			//es valido colocar la pieza
			bloquesTotales.addAll(pieza.bloques())
			console.println(pieza.ubicaciones())
			self.controlarLinea(pieza.ubicaciones().map({pos => pos.y()}).asSet())
			self.generarPieza()
		//}
		
		
	}
	method generarPieza() {
		const rnd = new Range(start = 2, end = 8).anyOne()
		const piezasPosibles = [new L(x=rnd,y=20),new I(x=rnd,y=20),new O(x=rnd,y=20),new J(x=rnd,y=20),new S(x=rnd,y=20),new Z(x=rnd,y=20),new T(x=rnd,y=20)]
		pieza = piezasPosibles.anyOne()
		pieza.agregarBloques()
		pieza.agregarVisuales()
	}
	
	
	
}
