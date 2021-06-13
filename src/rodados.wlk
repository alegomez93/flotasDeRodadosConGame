import pedidos.*
import dependencias.*
import colores.*
import wollok.game.*
import paredes.*


class Corsa
{
	const property capacidad = 4
	const property velocidad = 150
	const property peso = 1300
	var color
	var position
	const property oldPosition = []
	var property image = rojo.image()
	
	method color()
	{
		return color
	}
	
	method color(unColor)
	{
		color = unColor
		image = unColor.image()
	}
	
	
	method position()
	{
		return position
	}
	
	method position(unaPosition)
	{
		oldPosition.add(position)
		position = unaPosition
	}
	
	method pasoPor(posicion)
	{
		return oldPosition.contains(posicion)
	}
	
	method pasoPorFila(numero)
	{
		return oldPosition.any( {p => p.x() == numero} )
	}
	
	method recorrioFilas(listaDeNumeros)
	{
		return oldPosition.map( {p => p.x()} ) == listaDeNumeros
	}
	
	
	method up()
	{
		if (self.position().y() == game.height() -1)
			self.position(self.position().down(game.height() -1))
		else
			self.position(self.position().up(1))
	}
	
	
	method down()
	{
		if (self.position().y() == 0)
			self.position(self.position().up(game.height() -1))
		else
			self.position(self.position().down(1))
	}
	
	method left()
	{
		if (self.position().x() == 0)
			self.position(self.position().right(game.width() -1))
		else
			self.position(self.position().left(1))
	}
	
	method right()
	{
		if (self.position().x() == game.width() -1)
			self.position(self.position().left(game.width() -1))
		else
			self.position(self.position().right(1))
	}
	
	
	method chocarUna(pared)
	{
		const pos = self.oldPosition().last()
		const pos1 = self.position()
		if (pared.energia() == 0)
		{
			game.removeVisual(pared)
			self.position(new Position( x = pos1.x(), y = pos1.y()))
		}
			
		else
		{
			pared.energia(pared.energia() -1)
			self.position(new Position( x = pos.x(), y = pos.y()))
		}
	
	}
}


class Kwid
{
	var property tanqueAdicional
	const property color = "azul"
	
	method capacidad()
	{
		return if (tanqueAdicional) 3 else 4
	}
	
	method velocidad()
	{
		return if (tanqueAdicional) 120 else 110
	}
	
	method peso()
	{
		return if (tanqueAdicional) 1350 else 1200
	}
		
}

object trafic
{
	const property color = "blanco"
	var property interior = null
	var property motor = null
	
	
	method capacidad()
	{
		return interior.capacidad()
	}
	
	method velocidad()
	{
		return motor.velocidad()
	}
	
	method peso()
	{
		return interior.peso() + motor.peso() + 4000
	}
	
}

object comodo
{
	const property capacidad = 5
	const property peso = 700 
}


object popular
{
	const property capacidad = 12
	const property peso = 1000
}

object pulenta
{
	const property velocidad = 130
	const property peso = 800	
}

object bataton
{
	const property velocidad = 80
	const property peso = 500
}


class AutosEspeciales
{
	var property capacidad
	var property velocidad
	var property peso
	var property color	
}


object autoActivo
{
	const property listaAutos = []
	var controlAuto
	
	method agregarAuto(unAuto)
	{
		listaAutos.add(unAuto)
	}
	
	method controlAuto(num)
	{
		controlAuto = listaAutos.get(num)
		return controlAuto
	}	
}

object modoTodos
{
	const property copiaLista = autoActivo.listaAutos().copy()
	
	method color(unColor)
	{
		copiaLista.forEach( {p => p.color(unColor)} )
	}
	
	method up()
	{
		copiaLista.forEach( {p => p.up()} )
	}
	
	method down()
	{
		copiaLista.forEach( {p => p.down()} )
	}
	
	method left()
	{
		copiaLista.forEach( {p => p.left()} )
	}
	
	method right()
	{
		copiaLista.forEach( {p => p.right()} )
	}
}


