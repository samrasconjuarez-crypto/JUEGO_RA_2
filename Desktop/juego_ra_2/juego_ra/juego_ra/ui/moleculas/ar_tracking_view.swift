//
//  ar_tracking_view.swift
//  juego_ra
//
//  Created by alumno on 11/21/25.
//

import SwiftUI
import ARKit

struct ARTrackingView: UIViewRepresentable {
    
    @ObservedObject var servicioAR: ServicioAR

    func makeUIView(context: Context) -> ARSCNView {
        let vista = ARSCNView()
        vista.session = servicioAR.session
        vista.delegate = context.coordinator
        vista.automaticallyUpdatesLighting = true
        return vista
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinador {
        Coordinador()
    }

    class Coordinador: NSObject, ARSCNViewDelegate {}
}
