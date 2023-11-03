import wollok.game.*

object musica{
	
	var ruta="Sonidos/musica.mp3"
	const sonido=game.sound(ruta)
	
	method reproducir(){
		sonido.play()
	}
	
	method volumen(volumen){
		sonido.volume(volumen)
	}
	
	method loop(valor){
		sonido.shouldLoop(valor)
	}
}

/*object sonidoFinJuego{
	
	var ruta="Sonidos/FinJuego.mp3"
	const sonido=game.sound(ruta)
	
	method reproducir(){
			sonido.play()
			game.schedule(1,{=>sonido.stop()})
		
	}
}*/

