//
//  pantalla_vista_camara_ar.swift
//  juego_ra
//
//  Created by alumno on 11/21/25.
//

import SwiftUI

struct VistaCamaraAR: View {

    @State var servicioAR = ServicioAR()
    @Environment(ControladorJuego.self) var controlador

    @State var siguientePistaID: String?
    
    var body: some View {
        ZStack {
            ARTrackingView(servicioAR: servicioAR)
                .ignoresSafeArea()

            // Mensaje superpuesto estilo GF
            VStack {
                Text("Escanea para encontrar la siguiente pista…")
                    .font(.system(size: 20, weight: .black, design: .serif))
                    .padding(12)
                    .background(.black.opacity(0.4))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.top, 40)
                Spacer()
            }

            // Cuando se detecta la pista, navegamos
            if let pista = siguientePistaID {
                NavigationLink("", destination: SelectorPantallaPista(pista_id: pista), isActive: .constant(true))
            }
        }
        .onAppear {
            servicioAR.pistaDetectada = { nombre in
                // Aquí conectas una imagen digital con una pista del juego
                self.siguientePistaID = nombre
            }

            servicioAR.configurarSesion()
        }
    }
}
