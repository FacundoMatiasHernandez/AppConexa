//
//  DetalleNoticiaView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct DetalleNoticiaView: View {
    let noticia: Noticia

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(noticia.title)
                    .font(.largeTitle)
                    .bold()

                AsyncImage(url: URL(string: noticia.image)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)

                Text(noticia.content)
                    .font(.body)

                Text("Publicado: \(noticia.publishedAt)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .navigationTitle("Detalle")
    }
}


