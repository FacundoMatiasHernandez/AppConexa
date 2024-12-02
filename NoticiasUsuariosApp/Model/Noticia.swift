//
//  Noticia.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

struct Noticia: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

