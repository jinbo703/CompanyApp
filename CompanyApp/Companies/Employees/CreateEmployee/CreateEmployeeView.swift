//
//  CreateEmployeeView.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CreateEmployeeView: UIView {
    
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
        tf.clearButtonMode = .always
        return tf
    }()
    
    let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let birthdayTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "MM/dd/yyyy"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.clearButtonMode = .always
        return tf
    }()
    
    let employeeSegmentedControl: UISegmentedControl = {
        let types = [
            EmployeeType.Executive.rawValue,
            EmployeeType.SeniorManagement.rawValue,
            EmployeeType.Staff.rawValue,
            EmployeeType.Intern.rawValue
        ]
        let sc = UISegmentedControl(items: types)
        sc.tintColor = UIColor.customDarkBlue
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameTextField)
        mainView.addSubview(birthdayLabel)
        mainView.addSubview(birthdayTextField)
        mainView.addSubview(employeeSegmentedControl)
        
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        birthdayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        birthdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        birthdayLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        birthdayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        birthdayTextField.topAnchor.constraint(equalTo: birthdayLabel.topAnchor).isActive = true
        birthdayTextField.leftAnchor.constraint(equalTo: birthdayLabel.rightAnchor, constant: 16).isActive = true
        birthdayTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        birthdayTextField.bottomAnchor.constraint(equalTo: birthdayLabel.bottomAnchor).isActive = true
        
        employeeSegmentedControl.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 8).isActive = true
        employeeSegmentedControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        employeeSegmentedControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        employeeSegmentedControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
