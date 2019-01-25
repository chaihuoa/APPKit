//
//  UIView+Utils.swift
//  APPKit
//
//  Created by chai.chai on 2019/1/24.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import UIKit

public extension UIView {

    public convenience init(autoLayout: Bool = true) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = !autoLayout
    }
}
