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

    @State private var region: MKCoordinateRegion
    private var annotations: [Coordenadas] // Array de anotaciones

    init(coordenadas: Coordenadas) {
        let lat = Double(coordenadas.lat) ?? 0.0
        let lng = Double(coordenadas.lng) ?? 0.0

        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat, longitude: lng),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))

        self.coordenadas = coordenadas
        self.annotations = [coordenadas]
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
            MapMarker(coordinate: CLLocationCoordinate2D(
                latitude: Double(annotation.lat) ?? 0.0,
                longitude: Double(annotation.lng) ?? 0.0
            ), tint: .red) // Pongo un pin rojo para la localizacion del usuario
        }
        .navigationTitle("Ubicación")
    }
}


