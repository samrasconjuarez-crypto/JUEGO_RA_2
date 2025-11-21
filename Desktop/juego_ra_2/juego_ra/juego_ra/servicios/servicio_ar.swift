//
//  servicio_ar.swift
//  juego_ra
//
//  Created by alumno on 11/21/25.
//

import Foundation
import ARKit
import SwiftUI

@Observable
class ServicioAR: NSObject, ARSessionDelegate, ObservableObject {

    var session = ARSession()
    var pistaDetectada: ((String) -> Void)?  // callback para cuando detecte algo

    override init() {
        super.init()
        session.delegate = self
    }

    func configurarSesion() {
        let config = ARImageTrackingConfiguration()

        // Cargar todas las imágenes del catálogo
        if let imgs = ARReferenceImage.referenceImages(inGroupNamed: "PistasAR", bundle: .main) {
            config.trackingImages = imgs
            config.maximumNumberOfTrackedImages = 1
        } else {
            print("⚠️ ERROR: No se encontraron imágenes en el grupo 'PistasAR'")
        }

        session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }

    // Se ejecuta AUTOMÁTICAMENTE cuando ARKit reconoce una imagen
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { continue }

            let nombre = imageAnchor.referenceImage.name ?? "sin_nombre"
            print("📸 Imagen detectada: \(nombre)")

            // Llamar al callback
            pistaDetectada?(nombre)
        }
    }
}
