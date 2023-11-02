import wollok.game.*

object musica{
	
	var ruta="Sonidos/musica.mp3"
	const sonido=game.sound(ruta)
	
	method play(){
		sonido.play()
	}
	
	method volumen(volumen){
		sonido.volume(volumen)
	}
	
	method shouldLoop(valor){
		sonido.shouldLoop(valor)
	}
}

