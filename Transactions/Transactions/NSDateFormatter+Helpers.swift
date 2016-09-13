//
//  NSDateFormatter+Helpers.swift
//  Transactions
//
//  Created by Marcin on 13/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import Foundation

extension NSDateFormatter {
    
    func britishDateFormatter() -> NSDateFormatter {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'+00:00'"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        
        return dateFormatter
    }
}