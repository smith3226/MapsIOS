//
//  ContentView.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let persistenceController = PersistenceController.shared
    var body: some View {
            TabView {
                SearchCity()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                FavoritesListView()
                    .tabItem {
                        Label("Favorites", systemImage: "star.fill")
                    }
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    
}


