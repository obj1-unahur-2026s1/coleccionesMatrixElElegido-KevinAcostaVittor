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
        estaCansado = !estaCansado
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
    const pasajeros = []

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
    //     return pasajeros.map({c => c.vitalidad()}).max()
    // }
    
    // method pasajeroMayorVitalidad()
    // {
    //     return pasajeros.find({c => c.vitalidad() == self.mayorVitalidad()})
    // }

    method pasajeroMayorVitalidad()
    {
        return pasajeros.max({c => c.vitalidad()})
    }

    method pasajeroMayorVitalidad2()
    {
        return pasajeros.max({c => c.vitalidad()})
    }

    method estaEquilibrado()
    {
        return pasajeros.any({c => c.vitalidad() > c.vitalidad() * 2})
    }

    // COMANDO
    // [neo, trinity, morfeo] -> [true, false, false]
    method estaElElegido()
    {
        return pasajeros.any({c => c.esElegido()})
    }

    method chocar()
    {
        pasajeros.forEach({c => c.saltar() self.bajarPasajero(c)})
    }

    // method acelerar()
    // {
    //     self.pasajerosSinElegido().forEach({c => c.saltar()})
    // }
    // Method auxiliar para ^
    method pasajerosSinElegido()
    {
        return pasajeros.filter({c => !c.esElegido()})
    }

    method acelerar()
    {
        return pasajeros.forEach(c => if(c))
    }

    method pasajerosValiosos()
    {
        pasajeros.filter({c => c.vitalidad() > 5})
    }

    method unoAlHorno()
    {
        return pasajeros.any({c => c.vitalidad() == 0})
    }

    method puedeEnfrentarAgente()
    {
        pasajeros.
    }
}