//
//  LabratoryManagementSystemApp.swift
//  LabratoryManagementSystem
//
//  Created by Gourishanker on 23/11/23.
//

import SwiftUI

@main
struct LabratoryManagementSystemApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
