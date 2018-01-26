//
//  ViewController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 24/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CompaniesController: UITableViewController {

    let companyCellId = "companyCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Companies"
        
        customizeNavigationBar()
        setupNavBarButtons()
        setupTableView()
    }
    
    func customizeNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .customRed
        let atts = [NSAttributedStringKey.foregroundColor: UIColor.customLightBlue]
        navigationController?.navigationBar.largeTitleTextAttributes = atts
        navigationController?.navigationBar.titleTextAttributes = atts
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
        print("add company")
    }
}

extension CompaniesController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: companyCellId, for: indexPath) as! CompanyCell
        cell.textLabel?.text = "The Company Name"
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
}
