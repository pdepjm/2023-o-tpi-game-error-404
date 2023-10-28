import wollok.game.*
import Piezas.*

object tablero {
	
	const ubicacionesOcupadas = []
	var pieza
	
	method pieza()= pieza
	
	method iniciar() {
		self.generarPieza()
		game.onTick(800, "movimiento", { self.moverAbajo() })
	}
	
	method moverAbajo() {
	//const ocupadasX=ubicacionesOcupadas.map({ubic => ubic.x()})
	//const ocupadasY=ubicacionesOcupadas.map({ubic => ubic.y()})
	//const piezaY=pieza.ubicaciones().map({ubic => ubic.y()})
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
		if(pieza.noSaleDeTablero())
		 pieza.rotarIzquierda()
		 }
		 
	method rotarDerecha() {
		if(pieza.noSaleDeTablero())
		 pieza.rotarDerecha()
		 }
		 
	/* 
	method borrarLinea(){
		var x
		var y
		
		 if(game.at(x,y))
		 
	}
	*/
	
	method colocarPieza(){
		if(pieza.ubicaciones().any({ubi => ubicacionesOcupadas.contains(ubi)})){
			//no se puede colocar la pieza

		}else{
			//es valido colocar la pieza
			ubicacionesOcupadas.addAll(pieza.ubicaciones())
			self.generarPieza()
		}
		
	}
	method generarPieza() {
		const piezasPosibles = [new L(x=5,y=22),new I(x=5,y=22),new O(x=5,y=22),new J(x=5,y=22),new S(x=5,y=22),new Z(x=5,y=22),new T(x=5,y=22)]
		pieza = piezasPosibles.anyOne()
		pieza.agregarVisuales()
	}
}
