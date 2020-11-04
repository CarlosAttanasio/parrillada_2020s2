import comidas.*
import comensales.*

object cocina{
	const property listaComidas = []
	method agregarPlato(unPlato){ listaComidas.add(unPlato)}
	method removerPlato(unPlato){ listaComidas.remove(unPlato)}
	 
	method comidasVegetarianas(){return listaComidas.filter({ c => c.esAptoVegetariano()})}
	method comidasCarnivoras(){return listaComidas.filter({ c => not c.esAptoVegetariano()}) }
	method tieneBuenaOfertaVegetariana(){
		return (listaComidas.comidasVegetarianas() - listaComidas.comidasCarnivoras() <= 2).abs()
	}
	
	method platoFuerteCarnivoro(){
		return self.comidasCarnivoras().max({p=>p.valoracion()})
	}

	method comidasQueLeGustan(unComensal){
		return unComensal.comidasQueLeGustan()
	}

	method elegirPlato(unComensal){
		if(unComensal.comidasQueLeGustan().isEmpty()){
			self.error("No le gusta ningun plato")
		}else{
		const platoAComer=unComensal.comidas().anyOne()
		unComensal.comer(platoAComer)
		listaComidas.remove(platoAComer)
		
		}
	}

}

