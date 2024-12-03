//
//  UsuariosViewModel.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class UsuariosViewModel: ObservableObject {
    @Published var usuarios: [Usuario] = []
    @Published var searchText: String = ""

    private let repository = Repository()

    func cargarUsuarios() {
        repository.fetchUsuarios { [weak self] usuarios in
            DispatchQueue.main.async {
                if let usuarios = usuarios {
                    self?.usuarios = usuarios
                } else {
                    print("No se pudieron cargar los usuarios")
                }
            }
        }
    }

    var usuariosFiltrados: [Usuario] {
        if searchText.isEmpty {
            return usuarios
        } else {
            return usuarios.filter { "\($0.firstname) \($0.lastname)".lowercased().contains(searchText.lowercased()) }
        }
    }
}

