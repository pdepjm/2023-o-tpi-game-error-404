import wollok.game.*

object titulo {
	method position() = game.at(1,18)
	method image() = "titulo.png"
	
}

object texto {
	method position() = game.at(5,5)
	method text() = "Para Iniciar, presione space"
	method textColor() = "FFFFFF"
	method height()=10
	method width()=10
}

object puntaje {
	var property puntajeActual = 0
	method position() = game.at(13,18)
	method text() = "PUNTAJE: "+puntajeActual
	method textColor() = "FFFFFF"
}

object nivel{
	var property nivel = 1
	method position() = game.at(13,14)
	method text() = "Nivel: "+nivel
	method textColor() = "FFFFFF"
}
