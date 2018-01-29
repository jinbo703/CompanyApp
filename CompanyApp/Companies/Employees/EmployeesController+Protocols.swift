//
//  EmployeesController+Protocols.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

extension EmployeesController: CreateEmployeeDelegate {
    
    func didAddEmployee(employee: Employee) {
        guard let section = employeeTypes.index(of: employee.type!) else { return }
        let row = allEmployees[section].count
        let insertionIndexPath = IndexPath(row: row, section: section)
        allEmployees[section].append(employee)
        tableView.insertRows(at: [insertionIndexPath], with: .middle)
    }
    
}
