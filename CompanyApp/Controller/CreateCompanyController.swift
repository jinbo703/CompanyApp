//
//  CreateCompanyController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 25/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit
import CoreData

protocol CreateCompanyDelegate {
    func didAddCompany(company: Company)
    func didEditCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    let context = CoreDataManager.shared.persistentContainer.viewContext
    var delegate: CreateCompanyDelegate?
    var company: Company? {
        didSet {
            guard let companyName = company?.name else { return }
            nameTextField.text = companyName
        }
    }
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customLightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.customDarkBlue
        setupNavBarButtonItems()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = company == nil ? "Create Company" : "Edit Company"
    }
    
    func setupUI() {
        view.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameTextField)
        
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupNavBarButtonItems() {
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem = cancelBarButton
        
        let saveBarButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    func didEditCompany(company: Company) {
        print(company.name ?? "")
    }
    
    private func createCompany() {
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        company.setValue(nameTextField.text!, forKey: "name")
        do {
            try context.save()
            dismiss(animated: true, completion: {
                self.delegate?.didAddCompany(company: company as! Company)
            })
        } catch let err {
            print("Failed to save a company: \(err.localizedDescription)")
        }
    }
    
    private func updateCompany() {
        company?.name = nameTextField.text
        do {
            try context.save()
            dismiss(animated: true, completion: {
                guard let company = self.company else { return }
                self.delegate?.didEditCompany(company: company)
            })
            
        } catch let err {
            print("Failed to update a company", err.localizedDescription)
        }
    }
    
    @objc func handleSave() {
        if company == nil {
            createCompany()
        } else {
            updateCompany()
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
