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

object tablero{
	
	
	const bloquesTotales = []
	var pieza = new L(x=5,y=20)
	var nivelActual = 1
	
	method pieza()= pieza
	
	method iniciar() {
		self.generarPieza()
		game.onTick(800, "movimiento", { self.moverAbajo() })
		musica.reproducir()
		musica.volumen(0.1)
		musica.loop(true)
		game.addVisual(puntaje)
		game.addVisual(nroNivel)
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
		nroNivel.nivelTexto(nivelObjeto.nivel())
		nivelActual = nivelObjeto.nivel()
	}
	
	method controlarCambioDeNivel(){
		if(puntaje.puntajeActual() >= 50 && puntaje.puntajeActual() <= 100 && nivelActual != 2){ self.subirNivel() }
		else if(puntaje.puntajeActual() >= 100 && puntaje.puntajeActual() <= 200 && nivelActual != 3){ self.subirNivel() }
		else if(puntaje.puntajeActual() >= 200 && nivelActual != 4){ self.subirNivel() }
	}
	
	method moverAbajo() {
		if(!pieza.ubicaciones().any({ubi => ubi.y() == 1}) && self.puedeRealizarMov(0,-1)){
			pieza.moverAbajo()
			}else{
				self.colocarPieza()
				
			}
		}
		
	method moverArriba(){
		 pieza.moverArriba()
		 }
		 
	method moverDerecha() {
		if(!pieza.ubicaciones().any({ubi => ubi.x() == 10}) && self.puedeRealizarMov(1,0)){
			pieza.moverDerecha()
		}
	}
		 
	method moverIzquierda() {
		if(!pieza.ubicaciones().any({ubi => ubi.x() == 1}) && self.puedeRealizarMov(-1,0)){
			pieza.moverIzquierda()
		}
		 
 	}
		 
	method rotarIzquierda() {
		 pieza.rotarIzquierda()
		 }
		 
	method rotarDerecha() {
		 pieza.rotarDerecha()
		 }
	
	method controlarLinea(listaDeY) {
		listaDeY.forEach({y =>  
			if(bloquesTotales.count({bloque=> bloque.position().y() == y}) == 10){
				self.borrarLinea(y)
				self.controlarLinea(listaDeY)
			}
		})
	}
	
	method controlarFinJuego() {
		if(bloquesTotales.any({bloque =>  bloque.position().y()>=20})){
			console.println("Perdiste")
			self.volverMenu()		
		}else{
			self.generarPieza()
		}
	}
	
	method volverMenu() {
		bloquesTotales.forEach({bloque=>bloque.borrar()})
		bloquesTotales.clear()
		record.puntajeFinal(puntaje.puntajeActual())
		game.addVisual(record)
		puntaje.puntajeActual(0)
		self.cambiarNivel(nivel1) 
		game.removeTickEvent("movimiento")
		game.addVisual(gameOver)
  		game.removeVisual(puntaje)
  		game.removeVisual(nroNivel)
  		musica.pause()
  		pieza= new L(x=40,y=40)
	}

	method borrarLinea(linea) {
		const bloquesAEliminar = bloquesTotales.filter({bloque => bloque.position().y() == linea})
		bloquesAEliminar.forEach({bloque => bloque.borrar()})
		bloquesTotales.removeAllSuchThat({bloque => bloquesAEliminar.contains(bloque)})
		self.bajarDesde(linea+1)
		puntaje.puntajeActual(puntaje.puntajeActual() + 10)
	}
	method bajarDesde(linea) {
		bloquesTotales.filter({bloque => bloque.position().y() >= linea}).forEach({bloque => bloque.moverAbajo()})
	}
	
	method colocarPieza(){
		bloquesTotales.addAll(pieza.bloques())
		self.controlarLinea(pieza.ubicaciones().map({pos => pos.y()}).asSet())
		self.controlarFinJuego()
	}
	
	
	method ubicacionesOcupadas() = bloquesTotales.map({bloque => bloque.position()})
	
	
	//para bajar nx=0,ny=-1 para derecha nx=1, para izquierda nx=-1
	method puedeRealizarMov(nx,ny) = !pieza.ubicaciones().any({ubi => self.ubicacionesOcupadas().contains(new Position(x= ubi.x()+nx,y=ubi.y()+ny))})
	
	method generarPieza() {
		const rnd = new Range(start = 2, end = 8).anyOne()
		const piezasPosibles = [new L(x=rnd,y=20),new I(x=rnd,y=20),new O(x=rnd,y=20),new J(x=rnd,y=20),new S(x=rnd,y=20),new Z(x=rnd,y=20),new T(x=rnd,y=20)]
		pieza = piezasPosibles.anyOne()
		pieza.agregarBloques()
		pieza.agregarVisuales()
		self.controlarCambioDeNivel()
	}
	
}
