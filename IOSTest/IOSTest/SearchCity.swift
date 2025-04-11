//
//  SearchCity.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//


import SwiftUI

struct SearchCity: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search City", text: $viewModel.query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: viewModel.query) { _ in
                        viewModel.search()
                    }
                
                List(viewModel.places) { place in
                    NavigationLink(destination: MapScreen(name: place.display_name, lat: place.lat, lon: place.lon)) {
                        Text(place.display_name)
                    }
                }
            }
            .navigationTitle("Search City")
        }
    }
}
