//
//  camara.swift
//  juego_ra
//
//  Created by alumno on 11/12/25.
//

import SwiftUI

struct VistaCamara: View {
    @State var servicio_camara = ServicioCamara()
    
    
    var body: some View {
        ZStack{
            GeometryReader{ _ in
                CamaraPantallita(capa_sesion: servicio_camara.obtener_previsualizacion_camara())
                    .ignoresSafeArea()
            }
            
        }
        .onAppear{
            servicio_camara.iniciar()
        }
        .onDisappear{
            servicio_camara.detener()
        }
    }
}

#Preview {
    VistaCamara()
}
