class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante(){
		return self.peso() > 250
	} 
	

}

class HamburguesaDeCarne inherits Comida{
	var property pan
	override method peso(){return 250}
	override method esAptoVegetariano(){return false}
	override method valoracion(){ return 60 + pan.valoracion()}
	
}

class HamburguesaVegetariana inherits HamburguesaDeCarne{
	var property ingrediente 
	override method esAptoVegetariano(){return true}
	override method valoracion(){ return (super() + (2 * ingrediente.size()).min(17)) }
		
}

class Provoleta inherits Comida{
	var property tieneEspecias
	var property peso
	override method esAptoVegetariano(){return true}
	method esEspecial(){ return self.esAbundante() or self.tieneEspecias()}
	override method valoracion(){
		if (self.esEspecial()){ return 120}
		else {return 80}
	}
	
}

class Parrillada inherits Comida {
	const property cortesDeCarne = []
	method agregarAParrillada(unCorte){
		cortesDeCarne.add(unCorte)
	}
	override method esAptoVegetariano(){return false}
	override method peso(){return cortesDeCarne.sum({ corte => corte.peso()})}
	override method valoracion(){
		return ((15 * self.calidadMaximaDeCortes()) - self.cantidadDeCortes()).max(0)
	}
	method calidadMaximaDeCortes() {
	return cortesDeCarne.max({c => c.calidad()}).calidad()
	}
	method cantidadDeCortes(){ return cortesDeCarne.size()}
}

object panIndustrial{
	method valoracion(){ return 0}
}

object panCasero{
	method valoracion(){ return 20}
	
}

object panMasaMadre{
	
	method valoracion(){ return 45}
}


class CortesDeCarne {
	var property nombreCorte
	var property calidad
	var property peso
}