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
    
    
    func getTransactions(completion:(([Transaction]?, NSError?) -> ())) {
        
        let network = Network()
        
        network.download { (json, error) in
            
            if error == nil {
                
                if let json = json {
                    
                    let transactionParser = TransactionsParser(transactionsArray: json)
                    let transactions = transactionParser.getTransactionDetails()
                  //  print(transactions)
                    
                    completion(transactions, nil)
                }
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    
    
    struct TransactionsParser {
        
        let transactionsArray: [[String: AnyObject]]
        
        init(transactionsArray: [[String: AnyObject]]) {
            
            self.transactionsArray = transactionsArray
        }
        
        func getTransactionDetails() -> [Transaction] {
            
            let json = JSON(transactionsArray)
            
            
            var products = [Transaction]()
            for (key, _) in json {
                let product=Transaction()
                product.amount = json[Int(key)!]["amount"].doubleValue
                product.authorisation_date = json[Int(key)!]["authorisation_date"].stringValue
                product.description = json["burgers"][Int(key)!]["image"].stringValue
            //    product.location = json[Int(key)!]["location"].stringValue
                product.post_transaction_balance = json[Int(key)!]["post_transaction_balance"].doubleValue
                product.settlement_date = json[Int(key)!]["settlement_date"].stringValue
                
                products.append(product)
            }
            print(products)
            return products
            
        }
    }
}
