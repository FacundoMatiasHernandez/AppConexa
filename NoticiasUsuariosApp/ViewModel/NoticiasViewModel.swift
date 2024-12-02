//
//  NoticiasViewModel.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class NoticiasViewModel: ObservableObject {
    @Published var noticias: [Noticia] = []
    private let repository = Repository()

    func cargarNoticias() {
        repository.fetchNoticias { [weak self] noticias in
            DispatchQueue.main.async {
                self?.noticias = noticias ?? []
            }
        }
    }
}

