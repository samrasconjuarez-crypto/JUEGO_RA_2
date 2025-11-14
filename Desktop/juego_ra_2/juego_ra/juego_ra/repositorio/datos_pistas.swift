import CoreLocation

let pistas = [
    Pista(
        ubicacion:
            CLLocation(latitude: 31.74249399834499, longitude: -106.43208805090772),
        id: "pista_1",
        cuerpo:
            PistaInformacion(
                informacion: "Texto para mostrar al usario"
            )
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742440098507263,
            longitude: -106.43204945293003
        ), id: "pista_2", cuerpo: PistaInteractuable(informacion: "tecto de prueba para la pantalla interactuable", interacciones: [
            Boton(
                  mensaje: "Puchopicame para ir a la pista 1",
                  conecta_con_pista: "pista_1")
        ])
    )
]



