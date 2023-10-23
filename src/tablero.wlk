import wollok.game.*
import Piezas.*

object tablero {
	
	const ubicacionesOcupadas = []
	
	var pieza
	
	
	method iniciar() {
		self.generarPiezaRandom()
		pieza.agregarVisuales()
		//game.onTick(1000, "movimiento", { pieza.moverAbajo() })
	}
	
	method moverAbajo() {
		if(pieza.noSaleDeTablero())
			pieza.moverAbajo()
		}
	method moverArriba() {
		if(pieza.noSaleDeTablero())
		 pieza.moverArriba()
		 }
	method moverDerecha() {
		if(pieza.noSaleDeTablero())
		 pieza.moverDerecha()
		 }
	method moverIzquierda() {
		if(pieza.noSaleDeTablero())
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
