//
//  UsuariosViewModel.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import Foundation

class UsuariosViewModel: ObservableObject {
    @Published var usuarios: [Usuario] = []
    private let repository = Repository()

    func cargarUsuarios() {
        repository.fetchUsuarios { [weak self] usuarios in
            DispatchQueue.main.async {
                self?.usuarios = usuarios ?? []
            }
        }
    }
}


