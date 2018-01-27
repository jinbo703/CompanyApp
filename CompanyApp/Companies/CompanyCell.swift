//
//  CompanyCell.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 25/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    let companyImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "select_photo_empty"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        iv.layer.borderColor = UIColor.customDarkBlue.cgColor
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    let nameFoundedLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name - Founded:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.textColor = UIColor.customLightBlue
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .customGreen
        self.addSubview(companyImageView)
        self.addSubview(nameFoundedLabel)
        
        companyImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        companyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        companyImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        companyImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameFoundedLabel.leftAnchor.constraint(equalTo: companyImageView.rightAnchor, constant: 8).isActive = true
        nameFoundedLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameFoundedLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
