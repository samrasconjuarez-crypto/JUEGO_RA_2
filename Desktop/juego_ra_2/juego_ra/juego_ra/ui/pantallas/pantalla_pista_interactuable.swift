import SwiftUI
 
struct PantallaPistaInteractuable: View {
    
    var pista: PistaInteractuable
    @Environment(ControladorJuego.self) var controlador
    @Environment(\.dismiss) var dismiss    // Para regresar
    
    @State var camaraActiva = false        // Control de cámara
    
    var body: some View {
        ZStack {
            
            // ====== FONDO ======
            if camaraActiva {
                Color.clear     // la cámara se verá detrás
                    .ignoresSafeArea()
            } else {
                LinearGradient(
                    colors: [.gfRedDark, .gfRed],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
            
            // ====== MARCO (siempre visible) ======
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.gfInk.opacity(0.4), lineWidth: 4)
                .padding(16)
            
            // ====== CONTENIDO (solo cuando cámara NO está activa) ======
            if camaraActiva == false {
                VStack(spacing: 16) {
                    
                    // ====== BARRA SUPERIOR ======
                    HStack {
                        
                        // Flecha dentro de círculo azul
                        Button {
                            dismiss()
                        } label: {
                            Circle()
                                .fill(Color.gfTurquoise)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "chevron.left")
                                        .font(.title3.bold())
                                        .foregroundColor(.gfInk)
                                )
                        }
                        
                        Spacer()
                        
                        // Icono del diario dentro de círculo azul
                        NavigationLink {
                            PantallaDiario()
                        } label: {
                            Circle()
                                .fill(Color.gfTurquoise)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "book.closed")
                                        .font(.title3.bold())
                                        .foregroundColor(.gfInk)
                                )
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 8)
                    
                    
                    // ====== TÍTULO ======
                    Text("PISTA")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.gfYellow)
                        .shadow(radius: 3)
                    
                    
                    // ====== TEXTO DE LA PISTA ======
                    ScrollView {
                        Text(pista.informacion)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.gfCream)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.gfInk.opacity(0.35))
                            )
                            .padding(.horizontal, 24)
                    }
                    
                    Spacer(minLength: 12)
                }
            }
        }
    }
}
 
#Preview {
    PantallaPistaInteractuable(
        pista: PistaInteractuable(
            informacion: "Texto vacío de ejemplo para la pista.",
            interacciones: []
        )
    )
    .environment(ControladorJuego())
}
 
