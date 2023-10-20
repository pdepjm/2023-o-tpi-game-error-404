import wollok.game.*

class Bloque{
	
	var property position
	method image()="BloqueCeleste.png"
	
	
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

class L{
	
	var property position
	
	const bloque1=new Bloque(position=game.at(0,0))
	const bloque2=new Bloque(position=game.at(0,1))
	const bloque3=new Bloque(position=game.at(0,2))
	const bloque4=new Bloque(position=game.at(1,0))
	
	method agregarVisuales(){
		game.addVisual(bloque1)
		game.addVisual(bloque2)
		game.addVisual(bloque3)
		game.addVisual(bloque4)
	}
	
	
	method moverDerecha(){
		bloque1.moverDerecha()
		bloque2.moverDerecha()
		bloque3.moverDerecha()
		bloque4.moverDerecha()
	}
	
	method moverIzquierda(){
		bloque1.moverIzquierda()
		bloque2.moverIzquierda()
		bloque3.moverIzquierda()
		bloque4.moverIzquierda()
	}
	
	method moverAbajo(){
		bloque1.moverAbajo()
		bloque2.moverAbajo()
		bloque3.moverAbajo()
		bloque4.moverAbajo()
	}
	
	method moverArriba(){
		bloque1.moverArriba()
		bloque2.moverArriba()
		bloque3.moverArriba()
		bloque4.moverArriba()
	}
	
	method rotarDerecha(){
		bloque1.moverArriba()
		bloque2.moverDerecha()
		bloque3.moverAbajo()
		bloque3.moverDerecha()
		bloque3.moverDerecha()
		bloque4.moverIzquierda()
	}
	
	method rotarIzquierda(){
		/*agregar movimientos */
	}
	
}


class Pieza{
	
	var property position=game.center()
	var letra
	var cont=0

	method image() ="Piezas/"+letra+cont+".png"

	
	method moverIzquierda(){
		if(self.position().x() != 0 ){
			self.position(position.left(1))
		}else{
			self.position(position.left(0))
		}
		
	}
	
	method moverDerecha(){
		if(self.position().x() != game.width()){
			self.position(position.right(1))
		}else{
			self.position(position.right(0))
		}
		
	}
	
	method moverAbajo(){
		if(self.position().y() != 0){
			self.position(position.down(1))
		}else{
			self.position(position.down(0))
		}
	}
	
	method moverArriba(){
		if(self.position().y() != game.height()){
			self.position(position.up(1))
		}else{
			self.position(position.up(0))
		}
		
	}
	
	method rotarDerecha(){
		if(cont>3){
			cont=0
		}else if(cont<0){
			cont=3
		}else{
			if(cont==3){
				cont=0
			}else{
			cont+=1
			}	
		}
	}
	
	method rotarIzquierda(){
		if(cont>3){
			cont=0
		}else if(cont<0){
			cont=3
		}else{
			if(cont==0){
				cont=3
			}
			else{
				cont-=1
			}
			
		}
	}
		
}

const letras=["Lgirar","Igirar","Jgirar","Ogirar","Sgirar","Tgirar","Zgirar"]
