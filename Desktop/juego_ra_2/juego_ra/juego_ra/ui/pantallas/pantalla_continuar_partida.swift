//
//  pantalla_continuar_partida.swift
//  juego_ra
//
//  Muestra el progreso del jugador (Las páginas del diario recuperadas)
//

import SwiftUI

struct PantallaContinuarPartida: View {
    
    @Environment(ControladorJuego.self) var controlador
    
    // Calculamos qué pistas reales tiene el usuario basándonos en los IDs guardados
    var pistasDesbloqueadas: [Pista] {
        return pistas.filter { pista in
            controlador.ids_pistas_encontradas.contains(pista.id)
        }
    }
    
    var body: some View {
        ZStack {
            // 1. Fondo degradado (Igual a PantallaPrincipal)
            LinearGradient(
                colors: [.gfRedDark, .gfRed],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // 2. Encabezado
                Text("MIS DESCUBRIMIENTOS")
                    .font(.system(size: 28, weight: .black, design: .serif))
                    .tracking(2)
                    .foregroundColor(.gfYellow)
                    .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 3)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                
                // 3. Lista de Pistas
                if pistasDesbloqueadas.isEmpty {
                    // Caso Vacío
                    VStack(spacing: 15) {
                        Image(systemName: "book.closed.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gfInk.opacity(0.5))
                        
                        Text("El diario está vacío...")
                            .font(.system(size: 20, weight: .bold, design: .serif))
                            .foregroundColor(.gfCream)
                        
                        Text("Sal a explorar para llenar estas páginas.")
                            .font(.system(size: 16, design: .serif))
                            .foregroundColor(.gfCream.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    // Caso con Datos
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(pistasDesbloqueadas) { pista in
                                TarjetaDiario(pista: pista)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

// Subvista para cada "Página" o Pista encontrada
struct TarjetaDiario: View {
    let pista: Pista
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.gfRedDark)
                
                Text("PISTA: \(pista.id.uppercased())")
                    .font(.system(size: 18, weight: .black, design: .serif))
                    .foregroundColor(.gfRedDark)
                
                Spacer()
            }
            
            Divider()
                .background(Color.gfInk)
            
            // Extraemos el texto dependiendo del tipo de pista
            Group {
                if let info = pista.cuerpo as? PistaInformacion {
                    Text(info.informacion)
                } else if let interactuable = pista.cuerpo as? PistaInteractuable {
                    Text(interactuable.informacion)
                }
            }
            .font(.system(size: 16, weight: .medium, design: .serif))
            .foregroundColor(.gfInk)
            .italic()
            
        }
        .padding()
        .background(Color.gfCream) // Fondo color crema/papel
        .cornerRadius(12)
        // Borde estilo dibujo
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gfInk, lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
        // Pequeña rotación aleatoria para que parezca un diario desordenado
        .rotationEffect(.degrees(Double.random(in: -1...1)))
    }
}

#Preview {
    PantallaContinuarPartida()
        .environment(ControladorJuego())
}
