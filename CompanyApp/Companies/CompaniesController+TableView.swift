//
//  CompaniesController+TableView.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 27/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit
import CoreData

extension CompaniesController {
    
    final func setupTableView() {
        tableView.rowHeight = 60
        tableView.backgroundColor = .customDarkBlue
        tableView.separatorColor = .white
        tableView.register(CompanyCell.self, forCellReuseIdentifier: companyCellId)
        tableView.tableFooterView = UIView()
    }
    
    final func configureCell(_ cell: CompanyCell, at indexPath: IndexPath) {
        let company = companies[indexPath.row]
        if let name = company.name, let founded = company.founded {
            let foundedDateString = convertFrom(date: founded)
            cell.nameFoundedLabel.text = "\(name) - Founded: \(foundedDateString)"
        } else {
            cell.nameFoundedLabel.text = "\(company.name ?? "")"
        }
        if let imageData = company.imageData {
            cell.companyImageView.image = UIImage(data: imageData)
        } else {
            cell.companyImageView.image = #imageLiteral(resourceName: "select_photo_empty")
        }
    }
    
    final func deleteHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        let company = self.companies[indexPath.row]
        self.companies.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .left)
        context.delete(company)
        do {
            try context.save()
        } catch let err {
            print("Failed to delete a company", err.localizedDescription)
        }
    }
    
    final func editHandler(action: UITableViewRowAction, indexPath: IndexPath) {
        let createCompanyController = CreateCompanyController()
        createCompanyController.company = companies[indexPath.row]
        createCompanyController.delegate = self
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: companyCellId, for: indexPath) as! CompanyCell
        configureCell(cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .customLightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerLabel
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return companies.count == 0 ? 150 : 0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: deleteHandler)
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandler)
        deleteAction.backgroundColor = UIColor.customRed
        editAction.backgroundColor = UIColor.customDarkBlue
        return [deleteAction, editAction]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeesController = EmployeesController()
        let company = companies[indexPath.row]
        employeesController.company = company
        navigationController?.pushViewController(employeesController, animated: true)
    }
    
}









