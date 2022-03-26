//
//  DecimalUtil.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/25/22.
//

import Foundation


extension Decimal{
    var doubleValue: Double{
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
