import wollok.game.*
import Piezas.*

object tablero {
	
	const bloquesTotales = []
	var pieza
	
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
		 
	/* 
	method borrarLinea(){
		var x
		var y
		
		 if(game.at(x,y))
		 
	}
	*/
	
	method controlarLinea(listaDeY) {
		var cant
		listaDeY.forEach({y =>  
			cant = bloquesTotales.count({bloque=>
				bloque.position().y() == y
				
			})
			if(cant == 10){
			//se borra la linea
			console.println("llene la linea : "+y)
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
			self.controlarLinea(pieza.ubicaciones().map({pos => pos.y()}).asSet())
			self.generarPieza()
		//}
		
		
	}
	method generarPieza() {
		const piezasPosibles = [new L(x=5,y=20),new I(x=5,y=20),new O(x=5,y=20),new J(x=5,y=20),new S(x=5,y=20),new Z(x=5,y=20),new T(x=5,y=20)]
		pieza = piezasPosibles.anyOne()
		pieza.agregarVisuales()
	}
	
	
	
}
