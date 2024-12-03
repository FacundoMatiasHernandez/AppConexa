//
//  Usuario.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

struct Usuario: Identifiable, Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let birthDate: String
    let login: Login
    let address: Direccion
    let phone: String
    let website: String
    let company: Empresa
}

struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let md5: String
    let sha1: String
    let registered: String
}

struct Direccion: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Coordenadas
}

struct Coordenadas: Codable {
    let lat: String
    let lng: String
}

struct Empresa: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

