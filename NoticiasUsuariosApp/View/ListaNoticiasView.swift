//
//  ListaNoticiasView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct ListaNoticiasView: View {
    @StateObject var viewModel = NoticiasViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Buscar noticias", text: $searchText)
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

                List(viewModel.noticias.filter {
                    searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText)
                }) { noticia in
                    NavigationLink(destination: DetalleNoticiaView(noticia: noticia)) {
                        Text(noticia.title)
                    }
                }
            }
            .navigationTitle("Noticias")
            .onAppear { viewModel.cargarNoticias() }
        }
    }
}

