//
//  boton.swift
//  juego_ra
//
//  Created by alumno on 11/10/25.
//
//modelo boton
import Foundation


struct Boton: Identifiable{
    var id = UUID()
    let mensaje: String
    let conecta_con_pista: String
}
