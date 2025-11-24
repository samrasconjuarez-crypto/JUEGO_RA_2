//
//  datos_pistas.swift
//  juego_ra
//
//  Created by alumno on 11/5/25.
//

import CoreLocation

let pistas = [
    Pista(
        ubicacion:
            CLLocation(latitude: 31.742089468677683, longitude: -106.43242953904213),
        
        //edificio V: 31.742089468677683, -106.43242953904213
        //edificio C 31.742536761389587, -106.432063100641
        //Edificio D: 31.74251778578111, -106.43152726544731
        //Edificio B: 31.742577357854838, -106.43256740361848
        //Cancha detras del V: 31.74158990064806, -106.43248249436482
        
        
        id: "pista_1",
        cuerpo: PistaInteractuable(
            informacion: "Tienes mucho valor, humano. Los pies de esa criatura son enormes; ojalá te coma, JAJA. ¿Te atreverás a seguirlas?",
            interacciones: [
                Boton(
                    mensaje: "Pulsa para ir a la pista 2",
                    conecta_con_pista: "pista_2")
            ]
        )
        //imagen de huellas
    ),
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742536761389587,
            longitude: -106.432063100641
        ),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informacion: "Podrías construir muchas cosas con eso... como un puente inestable en el que posiblemente caigas.",
            interacciones: [
                Boton(
                    mensaje: "Puchopicame para ir a la pista 3",
                    conecta_con_pista: "pista_3")
            ]
        )
    ), //pedazo de madera
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.74251778578111,
            longitude: -106.43152726544731
        ),
        id: "pista_3",
        cuerpo: PistaInteractuable(
            informacion: "Una figura en la pared... He visto mejores fan arts de mí.",
            interacciones: [
                Boton(
                    mensaje: "Puchopicame para ir a la pista 4",
                    conecta_con_pista: "pista_4")
            ]
        )
    ), // triangulo grafiteado
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742577357854838,
            longitude: -106.43256740361848
        ),
        id: "pista_3",
        cuerpo: PistaInteractuable(
            informacion: "Vaya, sí que eres persistente... pero, ¿no crees que estás dando vueltas sin sentido como esa cosa que encontraste? Que, por cierto, le faltan esas cosas que marcan la hora.",
            interacciones: [
                Boton(
                    mensaje: "Puchopicame para ir a la pista 5",
                    conecta_con_pista: "pista_5")
            ]
        )
    ), //reloj sin manecillas
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.74158990064806,
            longitude: -106.43248249436482
        ),
        id: "pista_5",
        cuerpo: PistaInteractuable(
            informacion: "BUU",
            interacciones: [
                Boton(
                    mensaje: "Puchopicame para salir",
                    conecta_con_pista: "pista_5")
            ]
        )
    ), //Bill demoniaco
]




