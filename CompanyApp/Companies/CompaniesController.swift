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
    
    let footerLabel: UILabel  = {
        let label = UILabel()
        label.text = "No data available"
        label.textColor = UIColor.customLightBlue
        label.font = UIFont(name: "AvenirNext-Bold", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Companies"
        setupNavBarButtons()
        setupTableView()
        fetchCompanies()
    }
    
    func setupNavBarButtons() {
        setupPlusBarButton(selector: #selector(handleAddCompany))
        setupResetBarButton(selector: #selector(handleReset))
    }
    
    @objc private func handleAddCompany() {
        let createCompanyController = CreateCompanyController()
        createCompanyController.delegate = self
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated: true, completion: nil)
    }
    
    func fetchCompanies() {
        let companies = CoreDataManager.shared.fetchData()
        self.companies = companies
        tableView.reloadData()
    }
    
    @objc private func handleReset() {
        CoreDataManager.shared.deleteAll { (error) in
            if error != nil {
                print(error ?? "")
            } else {
                var indexPathsToRemove = [IndexPath]()
                for (index, _) in companies.enumerated() {
                    indexPathsToRemove.append(IndexPath(row: index, section: 0))
                }
                companies.removeAll()
                tableView.deleteRows(at: indexPathsToRemove, with: .left)
            }
        }
    }
}
