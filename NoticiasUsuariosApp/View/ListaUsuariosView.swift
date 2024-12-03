//
//  ListaUsuariosView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct ListaUsuariosView: View {
    @StateObject var viewModel = UsuariosViewModel()

    var body: some View {
        NavigationView {
            VStack {

                TextField("Buscar usuarios", text: $viewModel.searchText)
                    .padding(.leading, 30)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    )
                    .accessibilityIdentifier("BuscarUsuarios")
                    .padding(.horizontal)


                if viewModel.usuariosFiltrados.isEmpty {
                    Text("No hay usuarios disponibles")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.usuariosFiltrados) { usuario in
                        NavigationLink(destination: MapaView(coordenadas: usuario.address.geo, nombre: "\(usuario.firstname) \(usuario.lastname)")) {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.blue, Color.black]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 50, height: 50)
                                    Text("\(String(usuario.firstname.prefix(1)))\(String(usuario.lastname.prefix(1)))")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }

                                VStack(alignment: .leading) {
                                    Text("\(usuario.firstname) \(usuario.lastname)")
                                        .font(.headline)
                                    Text(usuario.email)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(usuario.phone)
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Usuarios")
            .onAppear {
                viewModel.cargarUsuarios()
            }
        }
    }
}

