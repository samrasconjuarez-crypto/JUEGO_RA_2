import SwiftUI

struct PantallaHistoria: View {
    
    @State private var mostrarTexto = false
    @State private var indiceLinea = 0
    
    // Bandera para saber si el usuario saltó la intro y detener la animación
    @State private var animacionSaltada = false
    
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
                
                // --- NUEVO: BOTÓN DE SALTAR ---
                // Solo lo mostramos si la historia no ha terminado
                if indiceLinea < historia.count {
                    HStack {
                        Spacer()
                        Button {
                            saltarHistoria()
                        } label: {
                            HStack(spacing: 4) {
                                Text("SALTAR")
                                Image(systemName: "forward.end.fill")
                            }
                            .font(.system(size: 14, weight: .bold, design: .serif))
                            .foregroundStyle(Color.gfCream.opacity(0.7))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.gfInk.opacity(0.3))
                            .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal, 20)
                    .transition(.opacity)
                }
                
                // TÍTULO
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
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .transition(.opacity.combined(with: .move(edge: .bottom)))
                    }
                }
                
                Spacer().frame(height: 80)
                
                
                // BOTÓN "COMENZAR LA AVENTURA"
                // Aparece cuando termina la historia o si el usuario la salta
                if indiceLinea == historia.count {
                    NavigationLink {
                        VistaCamaraAR()
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
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .onAppear {
            mostrarTexto = true
            animarHistoria()
        }
    }
    
    // --- LÓGICA DE ANIMACIÓN ---
    
    func animarHistoria() {
        for i in 1...historia.count {
            // Calculamos el tiempo de espera
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 2) {
                // MODIFICACIÓN:
                // Solo actualizamos si el usuario NO ha saltado la animación.
                // Esto evita que el texto parpadee o retroceda si saltamos.
                if !animacionSaltada {
                    withAnimation(.easeInOut) {
                        indiceLinea = i
                    }
                }
            }
        }
    }
    
    // --- LÓGICA DE SALTO ---
    func saltarHistoria() {
        withAnimation(.spring()) {
            animacionSaltada = true      // 1. Bloqueamos la animación lenta
            indiceLinea = historia.count // 2. Mostramos todo el texto de golpe
            mostrarTexto = true          // 3. Aseguramos que el título se vea
        }
    }
}

#Preview {
    NavigationStack {
        PantallaHistoria()
    }
}
