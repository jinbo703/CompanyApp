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
    
    func fetchData() -> [Company] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchErr {
            print("Failed to fetch companies", fetchErr.localizedDescription)
            return []
        }
    }
    
    func deleteAll(completion: (_ error: String?) -> Void) {
        let context = persistentContainer.viewContext
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        do {
            try context.execute(batchDeleteRequest)
            completion(nil)
        } catch let batchErr {
            let err = "Failed to delete all data: \(batchErr.localizedDescription)"
            completion(err)
        }
    }
    
    func createEmployee(company: Company, name: String, type: String, birthday: Date) -> (Employee? ,Error?) {
        let context = persistentContainer.viewContext
        
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        employee.company = company
        employee.name = name
        employee.type = type 
        
        let employeeInfo = NSEntityDescription.insertNewObject(forEntityName: "EmployeeInfo", into: context) as! EmployeeInfo
        employeeInfo.birthday = birthday
        employee.employeeInfo = employeeInfo
        
        do {
            try context.save()
            return (employee, nil)
        } catch let saveErr {
            return (nil, saveErr)
        }
    }
}

