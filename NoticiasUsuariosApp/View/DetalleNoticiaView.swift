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
        VStack(alignment: .leading, spacing: 10) {
            Text(noticia.title).font(.headline)
            Text(noticia.body).font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
    }
}

