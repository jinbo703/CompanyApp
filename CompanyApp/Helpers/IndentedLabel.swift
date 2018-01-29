//
//  IndentedLabel.swift
//  CompanyApp
//
//  Created by Pavel Bogart on 29/01/2018.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class IndentedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let customRect = UIEdgeInsetsInsetRect(rect, insets)
        super.drawText(in: customRect)
    }
}
