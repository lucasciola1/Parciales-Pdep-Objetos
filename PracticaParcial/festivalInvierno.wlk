class Vikingo {

    const property peso
    const property velocidad
    const property inteligencia 
    const property barbarosidad
    var property hambre
    const property item

    method valorDePesca() = peso / 2  + 2 * barbarosidad
    
    method valorDeDanio() = barbarosidad + item.danio()

    
    method cambiarHambre(n){
        hambre += n
    }  
}

class Item {
    const property danio 
}

class Posta {
    var property hambreGenerada
    method esMejor(competidor1, competidor2)
    method participar(competidor1, competidor2){
        if(competidor1.hambre() + hambreGenerada > 100 && competidor2.hambre() + hambreGenerada > 100)
        competidor1.cambiarHambre(hambreGenerada)

    }
    
    
    
}

class PostaDePesca inherits Posta(hambreGenerada = 5) {
    override method esMejor(competidor1,competidor2) = competidor1.valorDePesca() > competidor2.valorDePesca() 
}

class PostaDeCombate inherits Posta(hambreGenerada = 10){
override method esMejor(competidor1,competidor2) = competidor1.valorDeDanio() > competidor2.valorDeDanio()

}

class PostaDeCarrera inherits Posta(hambreGenerada = kmrecorridos) {
    var property kmrecorridos 
    override method esMejor(competidor1,competidor2) = competidor1.velocidad() > competidor2.velocidad()
    
}

object torneo {
    var property postas
    var property participantes = []


    method incribirParticipante = {participante -> participantes.add(participante)}
    
}