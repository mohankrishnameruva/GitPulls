//
//  GitPullsApp.swift
//  GitPulls
//
//  Created by Mohan Meruva on 20/04/22.
//

import SwiftUI

@main
struct GitPullsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
