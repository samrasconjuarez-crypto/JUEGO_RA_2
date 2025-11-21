import SwiftUI

struct PantallaHistoria: View {
    
    @State private var mostrarTexto = false
    @State private var indiceLinea = 0
    
    let historia = HistoriaDelJuego.introduccion
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.gfRed,
                    Color.gfRedDark.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("El Comienzo del Misterio")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.gfYellow)
                    .shadow(color: Color.gfInk.opacity(0.8), radius: 6)
                    .opacity(mostrarTexto ? 1 : 0)
                    .animation(.easeOut(duration: 1), value: mostrarTexto)
                
                
                // HISTORIA
                VStack(spacing: 14) {
                    ForEach(0..<indiceLinea, id: \.self) { i in
                        Text(historia[i])
                            .font(.title3.weight(.medium))
                            .foregroundStyle(Color.gfCream)
                            .shadow(color: Color.gfYellow.opacity(0.25), radius: 4)
                            .transition(.opacity.combined(with: .move(edge: .bottom)))
                    }
                }
                
                Spacer().frame(height: 80)
                
                
                //botón para continuar a la pantalla VistaCamara (moleculas -> camara)
                if indiceLinea == historia.count {
                    NavigationLink {
                        VistaCamara()
                    } label: {
                        Text("Comenzar la Aventura")
                            .font(.title2.bold())
                            .padding(.vertical, 16)
                            .padding(.horizontal, 50)
                            .background(Color.gfYellow)
                            .foregroundColor(Color.gfInk)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: Color.gfInk.opacity(0.8), radius: 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gfRedDark, lineWidth: 3)
                            )
                    }
                    .padding(.bottom, 40)
                    .transition(.opacity.animation(.easeIn(duration: 1)))
                }
            }
        }
        .onAppear {
            mostrarTexto = true
            animarHistoria()
        }
    }
    
    // Animación por líneas (el resto de la lógica se queda igual)
    func animarHistoria() {
        for i in 1...historia.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 2) {
                withAnimation(.easeInOut) {
                    indiceLinea = i
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        PantallaHistoria()
    }
}
