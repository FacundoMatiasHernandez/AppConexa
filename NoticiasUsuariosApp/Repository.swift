//
//  Repository.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class Repository {
    func fetchUsuarios(completion: @escaping ([Usuario]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.org/users") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            completion(try? JSONDecoder().decode([Usuario].self, from: data))
        }.resume()
    }

    func fetchNoticias(completion: @escaping ([Noticia]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.org/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            completion(try? JSONDecoder().decode([Noticia].self, from: data))
        }.resume()
    }
}

