//
//  GaNaDaApp.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/09/24.
//

import SwiftUI

@main
struct GaNaDaApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
