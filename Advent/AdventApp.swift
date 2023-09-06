//
//  AdventApp.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import SwiftUI

@main
struct AdventApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
