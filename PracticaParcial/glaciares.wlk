
//Parcial Glaciares

class Glaciar {
  var property masa
  var property desembocadura
  const property temperatura = 1

  method agregarTempano(peso) {
    masa += peso
  }
  
  method desprendimiento() {
    desembocadura.agregarTempano(self.pesoInicialTempano())
    masa -= self.pesoInicialTempano()
  }

  method pesoInicialTempano() = masa / 1000000 * desembocadura.temperatura()

}

class Embarcacion {
  const property tamano
  const property fuerzaMotor

  method puedeAtravesar(masaAgua) = masaAgua.esNavegablePor(self)

  method navega(masaAgua) {
    if(self.puedeAtravesar(masaAgua)) masaAgua.esNavegada()
  } 
 
}

class MasaDeAgua {
  const tempanos = []
  const temperaturaAmbiente
  var nuevoTempano

method agregarTempano(peso) {
  self.crearTempano(peso)
  tempanos.add(nuevoTempano)
}

  method crearTempano(peso) {
    nuevoTempano = new Tempano(masaTotal = peso)
  }
  method temperatura() = temperaturaAmbiente - tempanos.sum({tempano => tempano.cuantoEnfria()})

  method esAtractivo() = (tempanos.count({tempano => tempano.esAzul() || tempano.pesaMasDe500()})) > 5

  method esNavegada() {
    self.perderPeso()
    self.convertirTempanos()
    
  }

  method perderPeso(){
    tempanos.map({tempano=> tempano.pierdePeso()})
  }

  method convertirTempanos(){
    tempanos.filter({tempano => tempano.tipo() == compacto && !tempano.PesaMasDe500()}).map({tempano => tempano.convertirEnAireado()})
  }
  
}

class Rio inherits MasaDeAgua {
  const property velocidadBase

  override method temperatura() = super() + self.velocidad()

  method esNavegalePor(embarcacion) = embarcacion.fuerzaMotor() > self.velocidad()

  method velocidad() = velocidadBase - tempanos.count({tempano =>tempano.pesaMasDe500()})

}

class Lago inherits MasaDeAgua{
    
  method tiene20TempanosGrandes() = tempanos.count({tempano =>tempano.pesaMasDe500()}) > 20
  
  method esNavegablePor(embarcacion) = embarcacion.tamano() < 10 && self.temperatura() && self.tiene20TempanosGrandes() 
 } 

class Tempano {
  var property masaTotal
  var property tipo = compacto
 
method pesaMasDe500() = masaTotal > 500
  
  method masaVisible() = masaTotal * 0.15

  method seVeAzul() = tipo.esAzul(self.masaVisible())

  method cuantoEnfria() = tipo.cuantoEnfria(masaTotal)

  method convertirEnAireado() {
    tipo = aireado
  }

  method perderPeso(){
    masaTotal -= 1
  }
}

object aireado {
  method esAzul(_)= false

  method cuantoEnfria(_) = 0.5
  
}

object compacto {
  method esAzul(masaVisible)= masaVisible > 100

  method cuantoEnfria(peso) = peso / 100
}

// Parcial Festival de Invierno


