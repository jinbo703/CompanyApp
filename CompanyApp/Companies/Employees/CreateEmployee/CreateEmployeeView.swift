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
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameTextField)
        
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
