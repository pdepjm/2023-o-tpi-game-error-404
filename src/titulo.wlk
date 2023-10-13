import wollok.game.*

object titulo {
	method position() = game.at(3.5,18)
	method image() = "titulo.png"
	
}

object texto {
	method position() = game.center()
	method text() = "Para Iniciar, presione space"
	method textColor() = "FFFFFF"
}

