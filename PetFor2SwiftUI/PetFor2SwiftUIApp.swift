//
//  PetFor2SwiftUIApp.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 10/12/22.
//

import SwiftUI

@main
struct PetFor2SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
