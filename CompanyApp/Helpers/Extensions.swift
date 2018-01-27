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
    
}
