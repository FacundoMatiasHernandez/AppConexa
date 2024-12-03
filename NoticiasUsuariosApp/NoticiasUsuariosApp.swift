//
//  NoticiasUsuariosApp.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI

@main
struct NoticiasUsuariosApp: App {
    @State private var isLaunching = true
    var body: some Scene {
        WindowGroup {
            if isLaunching {
                LaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLaunching = false
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}

