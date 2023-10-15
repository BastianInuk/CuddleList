//
//  FastListApp.swift
//  FastList
//
//  Created by Bastian Inuk Christensen on 09/10/2023.
//

import SwiftUI
import SwiftData

@main
struct FastListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @State private var user = User()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.user, user)
        }
        .modelContainer(sharedModelContainer)
        .backgroundTask(.appRefresh("FETCH_DATA")) {
            
        }
    }
}
