//
//  FavoritesListView.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//

import SwiftUI

struct FavoritesListView: View {
    
    //fetch from core data
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.timestamp, order: .reverse)],
        animation: .default)
    
    private var placesSaved: FetchedResults<SavedPlace>
    
    var body: some View {
        NavigationView {
            List(placesSaved) { place in
                NavigationLink {
                    MapScreen(
                        name: place.name ?? "NA",
                        lat: String(place.latitude),
                        lon: String(place.longitude)
                    )
                } label: {
                    Text(place.name ?? "NA")
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

