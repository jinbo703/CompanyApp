//
//  CreateEmployeeController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

protocol CreateEmployeeDelegate {
    func didAddEmployee(employee: Employee)
}

class CreateEmployeeController: UIViewController {

    let mainView: CreateEmployeeView = {
        let view  = CreateEmployeeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var delegate: CreateEmployeeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Employee"
        view.backgroundColor = UIColor.customDarkBlue
        setupNavBarItems()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupNavBarItems() {
        setupCancelBarButton(selector: #selector(handleCancel))
        setupSaveBarButton(selector: #selector(handleSave))
    }
    
    @objc func handleSave() {
        guard let employeeName = mainView.nameTextField.text else { return }
        let tuple = CoreDataManager.shared.createEmployee(with: employeeName)
        if let err = tuple.1 {
            // show error alert
            print(err)
        } else {
            dismiss(animated: true, completion: {
                if let employee = tuple.0 {
                    self.delegate?.didAddEmployee(employee: employee)
                }
            })
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
