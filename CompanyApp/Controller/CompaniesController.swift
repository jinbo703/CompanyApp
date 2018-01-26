//
//  ViewController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 24/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController {

    var companies = [Company]()
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let companyCellId = "companyCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Companies"
        
        setupNavBarButtons()
        setupTableView()
        fetchCompanies()
    }
    
    func fetchCompanies() {
        let request = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(request)
            self.companies = companies
            self.tableView.reloadData() 
        } catch let err {
            print("Not able to fetch data: \(err.localizedDescription)")
        }
    }
    
    func setupNavBarButtons() {
        let rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAddCompany))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupTableView() {
        tableView.backgroundColor = .customDarkBlue
        tableView.separatorColor = .white
        tableView.register(CompanyCell.self, forCellReuseIdentifier: companyCellId)
        tableView.tableFooterView = UIView()
    }
    
    @objc func handleAddCompany() {
        let createCompanyController = CreateCompanyController()
        createCompanyController.delegate = self
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated: true, completion: nil)
    }
    
    private func deleteHandler(action: UITableViewRowAction, indexPath: IndexPath) {
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
    
    private func edithandler(action: UITableViewRowAction, indexPath: IndexPath) {
        let createCompanyController = CreateCompanyController()
        createCompanyController.company = companies[indexPath.row]
        createCompanyController.delegate = self
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated: true, completion: nil)
    }
}

extension CompaniesController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: companyCellId, for: indexPath) as! CompanyCell
        let company = companies[indexPath.row]
        cell.textLabel?.text = company.name
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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: deleteHandler)
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: edithandler)
        deleteAction.backgroundColor = UIColor.customRed
        editAction.backgroundColor = UIColor.customDarkBlue
        return [deleteAction, editAction]
    }
}

extension CompaniesController: CreateCompanyDelegate {
    
    func didAddCompany(company: Company) {
        companies.append(company)
        let indexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
    
    func didEditCompany(company: Company) {
        guard let row = companies.index(of: company) else { return }
        let reloadIndexPath = IndexPath(row: row, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)
    }
}
