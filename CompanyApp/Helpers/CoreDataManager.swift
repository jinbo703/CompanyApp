//
//  CoreDataManager.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 25/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import CoreData
import Foundation

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CompanyAppModel")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of storage is failed: \(err.localizedDescription)")
            }
        }
        return container
    }()
}

