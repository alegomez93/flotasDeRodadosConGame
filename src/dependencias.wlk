import rodados.*
import pedidos.*

class Dependencia
{
	const property flotaDeRodados = []
	const property registroDePedidos = []
	var property empleados
	
	method agregarAFlota(rodado)
	{
		flotaDeRodados.add(rodado)
	}
	
	method quitarDeFlota(rodado)
	{
		flotaDeRodados.remove(rodado)
	}
	
	method agregarPedido(unPedido)
	{
		registroDePedidos.add(unPedido)
	}
	
	method quitarPedido(unPedido)
	{
		registroDePedidos.remove(unPedido)
	}
	
	method pesoTotalFlota()
	{
		return flotaDeRodados.sum( {f => f.peso()} )
	}
	
	method estaBienEquipada()
	{
		return (flotaDeRodados.size() >= 3) and (flotaDeRodados.all( {f => f.velocidad() >= 100} ))
	}
	
	method capacidadTotalEnColor(color)
	{
		return flotaDeRodados.filter( {f => f.color() == color} ).sum( {f => f.capacidad()} )
	}
	
	method colorDelRodadoMasRapido()
	{
		return flotaDeRodados.max({f => f.velocidad()}).color()
	}
	
	method capacidadFaltante()
	{
		return self.empleados() - flotaDeRodados.sum( {f => f.capacidad()} )
	}
	
	method esGrande()
	{
		return (flotaDeRodados.size() >= 5) and (self.empleados() >= 40)
	}
	
	method totalPasajerosRegistrados()
	{
		return registroDePedidos.sum( {p => p.cantPasajeros()} )
	}
	
	method pedidosSinCumplirPorUn(auto)
	{
		return registroDePedidos.filter( {pedido => not pedido.puedeSatisfacerPedido(auto)})
	}
	
	method pedidosSinCumplir()
	{
		const listaRepetidos = flotaDeRodados.map( {auto => self.pedidosSinCumplirPorUn(auto)} ).flatten()
		
		return registroDePedidos.filter( {p => listaRepetidos.occurrencesOf(p) == flotaDeRodados.size()} )
	}
	
	method colorIncompatible(unColor)
	{
		return registroDePedidos.all( {p => p.coloresIncompatibles().contains(unColor)} )
	}
	
	
	method relajarPedidos()
	{
		registroDePedidos.forEach( {p => p.relajar()} )
	}

}









