//
//  DataController.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/28.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "WordData")
    
    init() {
        container.loadPersistentStores{ descriptoin, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
