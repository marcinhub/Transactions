//
//  NSDate+Helpers.swift
//  Transactions
//
//  Created by Marcin on 13/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import Foundation

extension NSDate {
    
   func trimDate() -> NSDate? {
        
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        if let dateComponents = gregorianCalendar?.components([.Day, .Month, .Year], fromDate: self) {
            
            return gregorianCalendar?.dateFromComponents(dateComponents)
        }
        
        return nil
    }
}
