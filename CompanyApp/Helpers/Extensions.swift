//
//  Extensions.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 27/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func convertFrom(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func convertFrom(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter.date(from: string)
    }

}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
