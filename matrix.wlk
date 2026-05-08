object neo
{
    var energia = 100
    method esElegido() = true

    method saltar()
    {
        energia /=  2
    }

    method vitalidad() = energia / 10
}

object morfeo
{
    method esElegido() = false
    var vitalidad = 8

    var estaCansado = false

    method saltar()
    {
        estaCansado = estaCansado.negate()  // o !estaCansado
        vitalidad -= 1
    }

    method vitalidad()
    {
        return vitalidad
    }
}

object trinity
{
    method esElegido() = false

    method saltar(){}

    method vitalidad()
    {
        return 0
    }
}

object nave
{
    const pasajeros = [morfeo, neo, trinity]

    method subirPasajero(pasajero)
    {
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero)
    {
        pasajeros.remove(pasajero)
    }

    method cuantosPasajeros()
    {
        return pasajeros.size()
    }
    
    // Transformer
    // [neo, trinity, morfeo] -> [10,0,8] -> 10
    // method mayorVitalidad()
    // {
    //     return pasajeros.map({p => p.vitalidad()}).max()
    // }
    
    // method pasajeroMayorVitalidad()
    // {
    //     return pasajeros.find({p => p.vitalidad() == self.mayorVitalidad()})
    // }

    method pasajeroMayorVitalidad()
    {
        return pasajeros.max({p => p.vitalidad()})
    }

    method pasajeroMenorVitalidad()
    {
        return pasajeros.min({p => p.vitalidad()})
    }

    method estaEquilibrado()
    {
        return self.pasajeroMayorVitalidad().vitalidad() < self.pasajeroMenorVitalidad().vitalidad() * 2
    }

    // COMANDO
    // [neo, trinity, morfeo] -> [true, false, false]
    method estaElElegido()
    {
        return pasajeros.any({p => p.esElegido()})
    }

    method chocar()
    {
        pasajeros.forEach({p => p.saltar() self.bajarPasajero(p)})
    }

    // method acelerar()
    // {
    //     self.pasajerosSinElegido().forEach({p => p.saltar()})
    // }
    // Method auxiliar para ^
    // method pasajerosSinElegido()
    // {
    //     return pasajeros.filter({c => !c.esElegido()})
    // }

    method acelerar()
    {
        return pasajeros.forEach({c => if(!c.esElegido())
        {
            c.saltar()
        }})
    }

    method pasajerosValiosos()
    {
        pasajeros.filter({p => p.vitalidad() > 5})
    }

    method unoAlHorno()
    {
        return pasajeros.any({p => p.vitalidad() == 0})
    }

    method puedeEnfrentarAgente()
    {
        return pasajeros.all({p => p.vitalidad() > 2})
    }

    method vitalidadPromedio()
    {
        return pasajeros.average({p => p.vitalidad()})
    }

    // Promedio se calcula como la suma de las cosas, dividido la cantidad de cosas.
    // method vitPromedio()
    // {
    //     return pasajeros.sum({p => p.vitalidad()}) / pasajeros.size()
    // }

    //5
    method cantidadVitalidadPar()
    {
        return pasajeros.filter({p => self.vitalidadPar(p)}).size()
    }

    method vitalidadPar(pasajero)
    {
        return pasajero.vitalidad().even()
    }

    //Alt
    // method vitalidadPar()
    // {
    //     return pasajeros.count({p => p.vitalidad().even()})
    // }

    //6
    method simularCombate()
    {
        pasajeros.forEach({p => self.pasajeroSaltarTresVeces(p)})
    }

    // Metodo auxiliar para ^
    method pasajeroSaltarTresVeces(pasajero)
    {
        pasajero.saltar()
        pasajero.saltar()
        pasajero.saltar()
    }

    // No se usa el times practicamente.
    method simularCombae(){
        pasajeros.forEach({p => 3.times(p.saltar())})
    }


    //Alt
    // method simularCombate2()
    // {
    //     pasajeros.forEach({p => p.saltar() p.saltar() p.saltar()})
    // }

    //7
    method listarVitalidad()
    {
        return pasajeros.map({p => p.vitalidad()})
    }

    //8
    method ordenarVitalidades()
    {
        return pasajeros.sortedBy({p1,p2 => p1.vitalidad() < p2.vitalidad()})
    }

    //9
    method limpiarBañoAlAzar()
    {
        return pasajeros.anyOne()
    }

    //10
    method cantidadElegidos()
    {
        return pasajeros.count({p => p.esElegido()})
    }

    //11

    //Para calcular productos
    method potenciaVital()
    {
        var vit = 1
        pasajeros.forEach({p => vit *= p.vitalidad()})
        return vit
    }
}