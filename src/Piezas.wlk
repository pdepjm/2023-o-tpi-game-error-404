import wollok.game.*

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
