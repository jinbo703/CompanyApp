//
//  EmployeesControllerTableViewController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBarItems()
    }
    
    func setupTableView() {
        tableView.backgroundColor = UIColor.customDarkBlue
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
    }
    
    func setupNavBarItems() {
        let rightBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(hanadleAddingEmployee))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func hanadleAddingEmployee() {
        let createEmployeeController = CreateEmployeeController()
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }

}

extension EmployeesController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
}
