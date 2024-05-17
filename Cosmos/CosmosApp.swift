//
//  CosmosApp.swift
//  Cosmos
//
//  Created by 😏 😏 on 19/10/2022.
//

import SwiftUI

@main
struct CosmosApp: App {
    let persistenceController = PersistenceController.shared

    var responseData = ResponseData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(responseData)
        }
    }
}
