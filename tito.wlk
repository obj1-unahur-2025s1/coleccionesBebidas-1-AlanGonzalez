object tito {
    var cantidad = 0
    var bebida = wisky
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 * cantidad
    method nutrientes() = 0
}
object cianuro {
    method rendimiento(cantidad) = 0
    method nutrientes() = 8
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
    }
    method nutrientes() = 12
}

object licuado {
    const ingredientes = []
    method rendimiento(cantidad) = ingredientes.map({i=>i.nutrientes()}).sum() * cantidad
    method agregarIngrediente(ingrediente) = ingredientes.add(ingrediente)
    
}

object aguaSaborizada {
    var bebida = terere
    method rendimiento(cantidad) = 1 + bebida.rendimiento(cantidad) / 4
    method cambiarBebida(nueva) {bebida = nueva}
}  

object coctel {
    const bebidas = []
    var rendimientoTotal= null
    
    method agregarBebida(bebida) {
        bebidas.add(bebida)
    }
    
    method rendimiento(cantidad) {
    if(bebidas.any({b=>b.rendimiento(cantidad) == 0})) {
        rendimientoTotal = 0
    }
    else {
        rendimientoTotal = bebidas.map({b=>b.rendimiento(cantidad)}).sum()
    }
    
    }

    method rendimientoTotal()= rendimientoTotal   
}    