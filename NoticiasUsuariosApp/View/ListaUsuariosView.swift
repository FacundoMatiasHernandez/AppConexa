//
//  ListaUsuariosView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct ListaUsuariosView: View {
    @StateObject var viewModel = UsuariosViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Buscar usuarios", text: $searchText)
                        .padding(.leading, 8)
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding([.horizontal, .top])

                List(viewModel.usuarios.filter {
                    searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                }) { usuario in
                    NavigationLink(destination: MapaView(coordenadas: usuario.address.geo)) {
                        VStack(alignment: .leading) {
                            Text(usuario.name).font(.headline)
                            Text(usuario.email).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Usuarios")
            .onAppear { viewModel.cargarUsuarios() }
        }
    }
}

