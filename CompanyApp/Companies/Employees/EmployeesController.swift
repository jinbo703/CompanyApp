//
//  EmployeesControllerTableViewController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit
import CoreData

class EmployeesController: UITableViewController {

    var company: Company? {
        didSet {
            guard let companyName = company?.name else { return }
            self.title = companyName
        }
    }
    var allEmployees = [[Employee]]()
    var executiveEmployees = [Employee]()
    var seniorEmployees = [Employee]()
    var staffEmployees = [Employee]()
    let context = CoreDataManager.shared.persistentContainer.viewContext
    let cellId = "cellId"
    var employeeTypes = [
        EmployeeType.Executive.rawValue,
        EmployeeType.SeniorManagement.rawValue,
        EmployeeType.Staff.rawValue,
        EmployeeType.Intern.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPlusBarButton(selector: #selector(hanadleAddingEmployee))
        fetchEmployees()
    }
    
    func fetchEmployees() {
        guard let companyEmployees = company?.employees?.allObjects as? [Employee] else { return }
        allEmployees = []
        employeeTypes.forEach { (employeeType) in
            allEmployees.append(
                companyEmployees.filter{ $0.type == employeeType }
            )
        }
    }
    
    @objc func hanadleAddingEmployee() {
        let createEmployeeController = CreateEmployeeController()
        createEmployeeController.delegate = self
        createEmployeeController.company = self.company
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }

}





