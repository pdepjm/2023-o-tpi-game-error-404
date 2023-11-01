import wollok.game.*
import Piezas.*
import sonidos.*
import titulo.*

object nivel1{
	method nivel() = 1
	method tiempo() = 800
}

object nivel2{
	method nivel() = 2
	method tiempo() = 600
}

object nivel3{
	method nivel() = 3
	method tiempo() = 400
}

object nivel4{
	method nivel() = 4
	method tiempo() = 200
}

object tablero {
	
	
	const bloquesTotales = []
	var pieza = new L(x=5,y=20)
	var nivelActual = 1
	
	method pieza()= pieza
	
	method iniciar() {
		self.generarPieza()
		game.onTick(800, "movimiento", { self.moverAbajo() })
		musica.play()
		musica.volumen(0.1)
		musica.shouldLoop(true)
		game.addVisual(puntaje)
		game.addVisual(nivel)
	}
	
	method subirNivel(){
		if(nivelActual <= 4){
			const niveles = [nivel1,nivel2,nivel3,nivel4]
		    self.cambiarNivel(niveles.get(nivelActual))
		}
				
	}
		
	method cambiarNivel(nivelObjeto){
		game.removeTickEvent("movimiento")
		game.onTick(nivelObjeto.tiempo(), "movimiento", { self.moverAbajo() })
		nivel.nivelTexto(nivelObjeto.nivel())
		nivelActual = nivelObjeto.nivel()
	}
	
	method controlarCambioDeNivel(){
		if(puntaje.puntajeActual() >= 50 && puntaje.puntajeActual() <= 100 && nivelActual != 2){ self.subirNivel() }
		else if(puntaje.puntajeActual() >= 100 && puntaje.puntajeActual() <= 200 && nivelActual != 3){ self.subirNivel() }
		else if(puntaje.puntajeActual() >= 200 && nivelActual != 4){ self.subirNivel() }
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
	
	method controlarFinJuego() {
		if(bloquesTotales.any({bloque =>  bloque.position().y()>=20})){
			console.println("Perdiste")
			bloquesTotales.forEach({bloque=>bloque.borrar()})
			bloquesTotales.clear()
			puntaje.puntajeActual(0)
			self.cambiarNivel(nivel1)
		}
	}
	
	method borrarLinea(linea) {
		const bloquesAEliminar = bloquesTotales.filter({bloque => bloque.position().y() == linea})
		bloquesAEliminar.forEach({bloque => bloque.borrar()})
		bloquesTotales.removeAllSuchThat({bloque => bloquesAEliminar.contains(bloque)})
		self.bajarDesde(linea+1)
		puntaje.puntajeActual(puntaje.puntajeActual() + 10)
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
			self.controlarFinJuego()
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
		self.controlarCambioDeNivel()
	}
			
}
