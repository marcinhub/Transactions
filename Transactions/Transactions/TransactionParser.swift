//
//  TransactionParser.swift
//  Transactions
//
//  Created by Marcin on 13/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TransactionsParser {
    
    let transactionsArray: [[String: AnyObject]]
    
    init(transactionsArray: [[String: AnyObject]]) {
        
        self.transactionsArray = transactionsArray
    }
    
    func getTransactionDetails() -> [(NSDate, [Transaction])] {
        
        var dictionaryOfDatesAndTransactions = [NSDate: [Transaction]]()
        
        let json = JSON(transactionsArray)
        
        var allDates: Array<NSDate> = Array()
        
        for (key, _) in json.enumerate() {
            
            let transaction = Transaction()
            
            transaction.amount = json[Int(key)]["amount"].doubleValue
            transaction.authorisation_date = json[Int(key)]["authorisation_date"].stringValue.toDate
            transaction.description = json[Int(key)]["description"].stringValue
            transaction.post_transaction_balance = json[Int(key)]["post_transaction_balance"].doubleValue
            transaction.settlement_date = json[Int(key)]["settlement_date"].stringValue.toDate
            
            if let authorisationDate = transaction.authorisation_date {
                
                if let trimmedDate = authorisationDate.trimDate() {
                    
                    transaction.dateOnly = trimmedDate
                    allDates.append(trimmedDate)
                }
            }
            
            if dictionaryOfDatesAndTransactions[allDates[key]] == nil {
                dictionaryOfDatesAndTransactions[allDates[key]] = [transaction]
            }
            else {
                dictionaryOfDatesAndTransactions[allDates[key]]?.append(transaction)
            }
        }
        
        let results = Array(dictionaryOfDatesAndTransactions).sort({ $0.0 > $1.0})
        
        return results
        
    }
}

    