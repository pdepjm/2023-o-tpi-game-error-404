import wollok.game.*
import Piezas.*

object tablero {
	
	const ubicacionesOcupadas = []
	var pieza
	
	method pieza()= pieza
	
	method iniciar() {
		self.generarPiezaRandom()
		pieza.agregarVisuales()
		game.onTick(1000, "movimiento", { self.moverAbajo() })
	}
	
	method moverAbajo() {
	//const ocupadasX=ubicacionesOcupadas.map({ubic => ubic.x()})
	//const ocupadasY=ubicacionesOcupadas.map({ubic => ubic.y()})
	//const piezaY=pieza.ubicaciones().map({ubic => ubic.y()})
	
		if(!pieza.ubicaciones().any({ubi => ubi.y() == 1})){
			pieza.moverAbajo()
			console.println(ubicacionesOcupadas)
			console.println(pieza.ubicaciones())
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
		if(pieza.noSaleDeTablero())
		 pieza.rotarIzquierda()
		 }
	method rotarDerecha() {
		if(pieza.noSaleDeTablero())
		 pieza.rotarDerecha()
		 }
	
	method colocarPieza(){
		//me tengo que fijar que la ubicacion no este ocupada y generar una ueva pieza
		if(pieza.ubicaciones().any({ubi => ubicacionesOcupadas.contains(ubi)})){
			//no se puede colocar la pieza
			//game.say(pieza,"UBICACION YA OCUPADA")
		}else{
			//es valido colocar la pieza
			ubicacionesOcupadas.addAll(pieza.ubicaciones())
			self.iniciar()
		}
		
	}
	method generarPiezaRandom() {
		//por ahora no esta hecho
		const piezasPosibles = [new L(x=6,y=24),new I(x=6,y=24),new O(x=6,y=24)]
		pieza = piezasPosibles.anyOne()
	}
}
