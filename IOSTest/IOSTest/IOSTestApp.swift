//
//  IOSTestApp.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//

import SwiftUI

@main
struct IOSTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
