//
//  EmployeesController+TableView.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

extension EmployeesController {
    
    func setupTableView() {
        tableView.backgroundColor = UIColor.customDarkBlue
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: cellId)
    }
    
    final func deleteHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        print("delete")
    }
    
    final func editHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        print("edit")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allEmployees.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEmployees[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EmployeeCell
        let employee = allEmployees[indexPath.section][indexPath.row]
        cell.textLabel?.text = employee.name
        if let birthdayDate = employee.employeeInfo?.birthday {
            let birthdayString = convertFrom(date: birthdayDate)
            cell.textLabel?.text = "\(employee.name ?? "")  \(birthdayString)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = IndentedLabel()
        header.textColor = UIColor.customDarkBlue
        header.font = UIFont.boldSystemFont(ofSize: 15)
        header.backgroundColor = UIColor.customLightBlue
        header.text = employeeTypes[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandler)
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: deleteHandler)
        editAction.backgroundColor = UIColor.customDarkBlue
        deleteAction.backgroundColor = UIColor.customRed
        return [deleteAction, editAction]
    }

}
