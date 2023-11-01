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
