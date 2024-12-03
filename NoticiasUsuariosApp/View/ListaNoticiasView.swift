//
//  ListaNoticiasView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct ListaNoticiasView: View {
    @StateObject var viewModel = NoticiasViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar noticias", text: $viewModel.searchText)
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
                    .padding(.horizontal)

                List(viewModel.noticiasFiltradas) { noticia in
                    NavigationLink(destination: DetalleNoticiaView(noticia: noticia)) {
                        VStack(alignment: .leading) {
                            Text(noticia.title).font(.headline)
                            AsyncImage(url: URL(string: noticia.image)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 150)
                        }
                    }
                }
            }            
            .navigationTitle("Noticias")
            .onAppear {
                viewModel.cargarNoticias()
            }
        }
    }
}
