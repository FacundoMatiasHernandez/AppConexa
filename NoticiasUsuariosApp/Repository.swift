//
//  Repository.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class Repository {
    private let baseURL = "https://jsonplaceholder.typicode.com"

    func fetchNoticias(completion: @escaping ([Noticia]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let noticias = try? JSONDecoder().decode([Noticia].self, from: data)
            completion(noticias)
        }.resume()
    }

    func fetchUsuarios(completion: @escaping ([Usuario]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/users") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let usuarios = try? JSONDecoder().decode([Usuario].self, from: data)
            completion(usuarios)
        }.resume()
    }
}

