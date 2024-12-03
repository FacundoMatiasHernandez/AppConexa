//
//  MapaView.swift
//  NoticiasUsuariosApp
//
//  Created by Facundo Hernández on 01/12/2024.
//

import SwiftUI
import MapKit

struct MapaView: View {
    let coordenadas: Coordenadas
    let nombre: String
    @State private var region: MKCoordinateRegion

    init(coordenadas: Coordenadas, nombre: String) {
        self.coordenadas = coordenadas
        self.nombre = nombre
        let lat = Double(coordenadas.lat) ?? 0.0
        let lng = Double(coordenadas.lng) ?? 0.0
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat, longitude: lng),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [coordenadas]) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(location.lat) ?? 0.0,
                                                             longitude: Double(location.lng) ?? 0.0)) {
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    Text(nombre)
                        .font(.caption)
                        .foregroundColor(.black)
                }
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Ubicación")
    }
}

extension Coordenadas: Identifiable {
    var id: String { "\(lat),\(lng)" }
}

