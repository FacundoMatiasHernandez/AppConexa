//
//  Noticia.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

struct Noticia: Identifiable, Codable {
    let id: Int
    let slug: String
    let title: String
    let content: String
    let image: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int
}

