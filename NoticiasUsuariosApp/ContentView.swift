//
//  ContentView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListaNoticiasView()
                .tabItem {
                    Label("Noticias", systemImage: "newspaper")
                }
                .tag(0)
                
            ListaUsuariosView()
                .tabItem {
                    Label("Usuarios", systemImage: "person.3")
                }
                .tag(1)
        }
    }
}

