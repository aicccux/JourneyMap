//
//  JourneyMapApp.swift
//  JourneyMap
//
//  Created by aicccux on 6/16/24.
//

import SwiftUI
import SwiftData

@main
struct JourneyMapApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MarkerItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MapView()
        }
        .modelContainer(sharedModelContainer)
    }
}
