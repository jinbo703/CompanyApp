//
//  CreateEmployeeController.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class CreateEmployeeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.customDarkBlue
        setupNavBarItems()
    }
    func setupNavBarItems() {
        let leftbarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem = leftbarButton
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
