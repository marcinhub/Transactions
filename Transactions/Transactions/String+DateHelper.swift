//
//  String+DateHelper.swift
//  Transactions
//
//  Created by Marcin on 07/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import Foundation

extension String {
    
    var toDate : NSDate? {
        
        let dateFormatter = NSDateFormatter().britishDateFormatter()
        if let date = dateFormatter.dateFromString(self) {
            return date
        }
        return nil
    }
}

extension String {
    
    var toDateOnly : NSDate? {
        
        let dateFormatter = NSDateFormatter().britishDateFormatter()
        if let date = dateFormatter.dateFromString(self) {
            return date
        }
        return nil
    }
}

extension NSDate: Comparable {}
    public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs) == .OrderedSame
    }

    public func >(lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs) == .OrderedDescending
    }

    public func <(lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
    }

    public func <=(lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs < rhs || lhs == rhs
    }

    public func >=(lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs > rhs || lhs == rhs
}