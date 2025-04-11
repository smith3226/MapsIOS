//
//  MapScreen.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//


import SwiftUI
import MapKit

struct MapScreen: View {
    //state
    let name: String
    let coordinate: CLLocationCoordinate2D

    @Environment(\.managedObjectContext) private var viewContext
    @State private var region: MKCoordinateRegion

    //constructor
    init(name: String, lat: String, lon: String) {
        self.name = name
        let coord = CLLocationCoordinate2D(latitude: Double(lat) ?? 0.0, longitude: Double(lon) ?? 0.0)
        self.coordinate = coord
        _region = State(initialValue: MKCoordinateRegion(center: coord, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }

    var body: some View {
        VStack {
            //map cordinates
            Map(coordinateRegion: $region, annotationItems: [MapPin(coordinate: coordinate)]) { pin in
                MapMarker(coordinate: pin.coordinate, tint: .red)
            }
            .frame(height: 300)

            
            Button("Save to Favorites") {
                let newPlace = SavedPlace(context: viewContext)
                newPlace.name = name
                newPlace.latitude = coordinate.latitude
                newPlace.longitude = coordinate.longitude
                newPlace.timestamp = Date()

                do {
                    try viewContext.save()
                    print("Saved.")
                } catch {
                    print("Failed to save:", error.localizedDescription)
                }
            }
            .padding()
        }
        .navigationTitle(name)
    }
}



struct MapPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
