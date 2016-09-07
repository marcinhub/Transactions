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
    
    
    
    func download(completion:(([String: AnyObject]?, error: NSError?) -> ())) {
        
        
        Alamofire.request(.GET, "http://coffeeport.herokuapp.com/burgers/?format=json")
            .responseJSON { response in switch response.result {
                
            case .Success(let JSON):
                
                print("Success with JSON: \(JSON)")
                
                completion(JSON as? [String : AnyObject], error: nil)
                
            case .Failure(let error):
                
                print("Request failed with error: \(error)")
                
                completion(nil, error: error)
                }
        }
        
    }
}
