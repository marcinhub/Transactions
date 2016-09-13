//
//  TransactionsService.swift
//  Transactions
//
//  Created by Marcin on 07/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TransactionsService: UIViewController {
    
    func getTransactions(completion:([(NSDate, [Transaction])]?, NSError?) -> ()) {
        
        let network = Network()
        
        network.download { (json, error) in
            
            if error == nil {
                
                if let json = json {
                    
                    let transactionParser = TransactionsParser(transactionsArray: json)
                    let transactions = transactionParser.getTransactionDetails()
                    
                    completion(transactions, nil)
                }
            }
            else {
                
                completion(nil, error)
            }
        }
    }   
}


