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
            guard let founded = company?.founded else { return }
            guard let imageData = company?.imageData else { return }
            mainView.nameTextField.text = companyName
            mainView.datePicker.date = founded
            mainView.companyImageView.image = UIImage(data: imageData)
        }
    }
    
    let mainView: CreateCompanyView = {
        let view = CreateCompanyView()
        view.backgroundColor = UIColor.customLightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    func setupNavBarButtonItems() {
        setupCancelBarButton(selector: #selector(handleCancel))
        setupSaveBarButton(selector: #selector(handleSave))
    }
    
    func setupUI() {
        mainView.selectPhotoAction = handleSelectPhoto
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    private func createCompany() {
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        company.setValue(mainView.nameTextField.text!, forKey: "name")
        company.setValue(mainView.datePicker.date, forKey: "founded")
       
        if let companyImage = mainView.companyImageView.image {
            let imageData = UIImageJPEGRepresentation(companyImage, 0.8)
            company.setValue(imageData, forKey: "imageData")
        }
         
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
        company?.name = mainView.nameTextField.text
        company?.founded = mainView.datePicker.date
        
        if let companyImage = mainView.companyImageView.image {
            let imageData = UIImageJPEGRepresentation(companyImage, 0.8)
            company?.imageData = imageData
        }
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

