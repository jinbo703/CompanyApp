//
//  CreateCompanyView.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CreateCompanyView: UIView {
    
    var selectPhotoAction: (() -> Void)?
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customLightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var companyImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "select_photo_empty"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.layer.cornerRadius = iv.frame.width / 2
        iv.clipsToBounds = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectPhoto)))
        return iv
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
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(nameTextField)
        mainView.addSubview(datePicker)
        mainView.addSubview(companyImageView)
        
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        companyImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        companyImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        companyImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        companyImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: companyImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 16).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        datePicker.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
    
    @objc func handleSelectPhoto(sender: Any) {
        selectPhotoAction?()
    }
}


