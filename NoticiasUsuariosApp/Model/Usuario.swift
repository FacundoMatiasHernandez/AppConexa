//
//  Usuario.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

struct Usuario: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let address: Direccion
}

struct Direccion: Codable {
    let street: String
    let suite: String
    let city: String
    let geo: Coordenadas
}

struct Coordenadas: Codable, Identifiable {
    var id: String { 
        "\(lat)-\(lng)"
    }
    let lat: String
    let lng: String
}


