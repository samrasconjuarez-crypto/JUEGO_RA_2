//
//  controlador_juego.swift
//  juego_ra
//
//  Created by alumno on 11/14/25.
//

import Foundation
import SwiftUI

@Observable
class ControladorJuego {
 
    
    ///controlador para guardar las partidas
    var ids_pistas_encontradas: [String] = []
    
    init() {
       
        cargar_progreso()
    }
    
    
    
    func el_usuario_encontro(pista: Pista) {
        // Si la pista NO está en la lista, la agregamos
        if !ids_pistas_encontradas.contains(pista.id) {
            ids_pistas_encontradas.append(pista.id)
            
            // Y guardamos inmediatamente en la memoria del teléfono
            guardar_progreso()
            print("¡Progreso guardado! Pista \(pista.id) registrada.")
        }
    }
    
    // Función para verificar si mostrar la pista como "Nueva" o "Ya vista"
    func verificar_si_esta_encontrada(pista: Pista) -> Bool {
        return ids_pistas_encontradas.contains(pista.id)
    }
    
    // Función para el botón "Empezar Misión" (Borra todo)
    func reiniciar_juego() {
        ids_pistas_encontradas.removeAll()
        guardar_progreso()
    }
    
    // --- MEMORIA DEL TELÉFONO (UserDefaults) ---
    
    private func guardar_progreso() {
        // Guardamos la lista de textos en la "cajita" estándar de iOS
        UserDefaults.standard.set(ids_pistas_encontradas, forKey: "pistas_encontradas_guardadas")
    }
    
    private func cargar_progreso() {
        // Intentamos leer la cajita. Si hay algo, lo cargamos.
        if let guardados = UserDefaults.standard.array(forKey: "pistas_encontradas_guardadas") as? [String] {
            ids_pistas_encontradas = guardados
        }
    }
}
