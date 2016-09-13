//
//  Transaction.swift
//  Transactions
//
//  Created by Marcin on 07/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import Foundation

class Transaction {
    
    var amount : Double = 0
    var authorisation_date : NSDate?
    var description : String = ""
    var post_transaction_balance : Double = 0
    var settlement_date : NSDate?
    var dateOnly : NSDate?
}