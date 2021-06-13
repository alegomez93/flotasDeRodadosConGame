import rodados.*
import dependencias.*


class Pedido
{
	var property distancia
	var property tiempo
	var property cantPasajeros
	const property coloresIncompatibles = #{}
	
	method agregarColoresIncomp(unColor)
	{
		return coloresIncompatibles.add(unColor)
	}
	
	method quitarColoresIncomp(unColor)
	{
		return coloresIncompatibles.remove(unColor)
	}
	
	method velocidad()
	{
		return distancia / tiempo
	}
	
	method puedeSatisfacerPedido(unAuto)
	{
		return (unAuto.velocidad() >= self.velocidad() +10) and (unAuto.capacidad() >= self.cantPasajeros()) and (not coloresIncompatibles.contains(unAuto.color()))
	}
	
	method acelerar()
	{
		tiempo =- 1
	}
	
		method relajar()
	{
		tiempo =+ 1
	}
}