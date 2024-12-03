//
//  NoticiasViewModel.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class NoticiasViewModel: ObservableObject {
    @Published var noticias: [Noticia] = []
    @Published var searchText: String = ""

    private let repository = Repository()

    func cargarNoticias() {
        repository.fetchNoticias { [weak self] noticias in
            DispatchQueue.main.async {
                self?.noticias = noticias ?? []
            }
        }
    }

    var noticiasFiltradas: [Noticia] {
        if searchText.isEmpty {
            return noticias
        } else {
            return noticias.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}
