//
//  pantalla_pista_informacion.swift
//  juego_ra
//
//  Created by alumno on 11/12/25.
//

import SwiftUI

struct PantallaPistaInformacion: View {
    var cuerpo_pista: PistaInformacion
    
    var body: some View {
        Text(cuerpo_pista.informacion)
    }   
}
