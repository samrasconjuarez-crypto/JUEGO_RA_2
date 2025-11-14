import SwiftUI

struct PantallaPistaInteractuable: View {
    var pista: PistaInteractuable
    @Environment(ControladorJuego.self) var controlador
    
    var body: some View {
        Text(pista.informacion)
        
        ForEach(pista.interacciones){ boton in
            NavigationLink {
                SelectorPantallaPista(pista_id: boton.conecta_con_pista)
            }
            label: {
                Text(boton.mensaje)
            }
        }
    }
}


#Preview {
    PantallaPistaInteractuable(pista:
        PistaInteractuable(informacion: "Texto vacio", interacciones: [
            Boton(mensaje: "mensaje de boton",
            conecta_con_pista: "pista_1")]
    ))
    .environment(ControladorJuego())
}
