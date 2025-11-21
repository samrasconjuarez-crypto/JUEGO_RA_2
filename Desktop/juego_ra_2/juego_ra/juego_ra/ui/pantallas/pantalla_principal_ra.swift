import SwiftUI
 
extension Color {
    static let gfRedDark = Color(red: 0.65, green: 0.22, blue: 0.17)
    static let gfRed = Color(red: 0.89, green: 0.32, blue: 0.23)
    static let gfYellow = Color(red: 0.96, green: 0.78, blue: 0.29)
    static let gfTurquoise = Color(red: 0.24, green: 0.62, blue: 0.61)
    static let gfCream = Color(red: 0.97, green: 0.89, blue: 0.75)
    static let gfInk = Color(red: 0.13, green: 0.09, blue: 0.07)
}
 
struct PantallaPrincipal: View {
    
    @State var proveedor_ubicacion = ServicioUbicacion()
 
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Fondo degradado estilo Gravity Falls
                LinearGradient(
                    colors: [.gfRedDark, .gfRed],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
 
                VStack(spacing: 20) {
                    
                    
 
                    // Título
                    VStack(spacing: 4) {
                        Text("DIARIO")
                            .font(.system(size: 40, weight: .black, design: .serif))
                            .tracking(4)
                            .foregroundColor(.gfCream)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 3)
 
                        Text("PERDIDO")
                            .font(.system(size: 36, weight: .black, design: .serif))
                            .tracking(4)
                            .foregroundColor(.gfYellow)
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 3)
                    }
                    .padding(.top, 40)
                    
                    Image("Diario1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .shadow(color: .black.opacity(0.5), radius: 8, x:0, y: 4)
 
                    // Cinta decorativa
                    Text("Bienvenidos a su primera misión")
                        .font(.system(size: 16, weight: .semibold, design: .serif))
                        .foregroundColor(.gfCream)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.gfTurquoise)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.gfInk, lineWidth: 2)
                                )
                        )
                        .shadow(radius: 4)
 
                    Spacer().frame(height: 20)
 
                    // Botones principales
                    VStack(spacing: 12) {
 
                        NavigationLink {
                            VistaCamaraAR()
                        } label: {
                            botonGF(texto: "Empezar misión")
                        }
 
                        NavigationLink {
                            Text("Pantalla de continuar partida")
                                .foregroundColor(.gfInk)
                        } label: {
                            botonGF(texto: "Continuar")
                        }
 
                        Button {
                            print("Salir del juego")
                        } label: {
                            botonGF(texto: "Salir")
                        }
                    }
                    .padding(.horizontal, 32)
 
                    Spacer()
 
                    // Pie de página
                    Text("No hay lugar para héroes en mi mundo.")
                        .font(.system(size: 12, weight: .medium, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gfCream.opacity(0.8))
                        .padding(.bottom, 18)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
 
// Botón estilo Gravity Falls
@ViewBuilder
func botonGF(texto: String) -> some View {
    Text(texto.uppercased())
        .font(.system(size: 18, weight: .black, design: .serif))
        .foregroundColor(.gfInk)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.gfCream)
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gfInk, lineWidth: 2)
            }
        )
        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 3)
}
 
 
#Preview {
    PantallaPrincipal()
}
 
