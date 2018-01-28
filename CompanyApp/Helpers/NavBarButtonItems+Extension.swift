//
//  NavBarButtonItems+Extension.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 28/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupPlusBarButton(selector: Selector) {
        let rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: selector)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupCancelBarButton(selector: Selector) {
        let leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: selector)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupResetBarButton(selector: Selector) {
        let leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: selector)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupSaveBarButton(selector: Selector) {
        let saveBarButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: selector)
        navigationItem.rightBarButtonItem = saveBarButton
    }
}
