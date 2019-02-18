//
//  Array+Utils.swift
//  APPKit
//
//  Created by chai.chai on 2019/2/18.
//  Copyright © 2019 chai.chai. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    @discardableResult
    public mutating func remove(_ element: Element) -> Index? {
        guard let index = index(of: element) else { return nil }
        remove(at: index)

        return index
    }
}
