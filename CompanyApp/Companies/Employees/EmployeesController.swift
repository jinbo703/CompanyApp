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
            if let companyName = company?.name {
                navigationItem.title = companyName
            } else {
                print("Failed to fetch a company name")
            }
        }
    }
    
    var employees = [Employee]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPlusBarButton(selector: #selector(hanadleAddingEmployee))
        fetchEmployees()
    }
    
    func setupTableView() {
        tableView.backgroundColor = UIColor.customDarkBlue
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func hanadleAddingEmployee() {
        let createEmployeeController = CreateEmployeeController()
        createEmployeeController.delegate = self
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }
    
    func fetchEmployees() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        do {
            let employees = try context.fetch(fetchRequest)
            self.employees = employees
        } catch let err {
            print("Failed to fetch employees:", err.localizedDescription)
        }
    }

}

extension EmployeesController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EmployeeCell
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name
        return cell
    }
    
}

extension EmployeesController: CreateEmployeeDelegate {
    
    func didAddEmployee(employee: Employee) {
        employees.append(employee)
        let indexPath = IndexPath(row: employees.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
    
}





