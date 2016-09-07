//
//  ViewController.swift
//  Transactions
//
//  Created by Marcin on 07/09/2016.
//  Copyright © 2016 MarcinSteciuk. All rights reserved.
//

import UIKit

class TransactionsListViewController: UIViewController {

    var transactionsService: TransactionsService?
    var transactions: [Transaction]?
    
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "Transactions";
        
        TransactionsService().getTransactions() { (transactions, error) in
            
            if error == nil {
                
                if let transactions = self.transactions {
                    
                    self.transactions = transactions
                    
                    print(self.transactions)
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        self.tableVIew.reloadData()
                    }
                }
            }
            else {
                
                let alert = UIAlertController(title: "Alert", message: "No internet connection. Please connect to the internet.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
}

