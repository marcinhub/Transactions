//
//  Network.swift
//  Transactions
//
//  Created by Marcin on 07/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//


import Foundation
import Alamofire

struct Network {
    
    func download(completion:(([[String: AnyObject]]?, error: NSError?) -> ())) {
        
        Alamofire.request(.GET, "http://private-710eeb-lootiosinterview.apiary-mock.com/transactions")
            .responseJSON { response in switch response.result {
                
            case .Success(let JSON):
                
                completion(JSON as? [[String : AnyObject]], error: nil)
                
                
            case .Failure(let error):
                                
                completion(nil, error: error)
            }
        }
    }
}
