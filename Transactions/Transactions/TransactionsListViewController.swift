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
    var transactions: [(NSDate, [Transaction])]?
    
    @IBOutlet weak var tableVIew: UITableView!
    
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Transactions";
        
        TransactionsService().getTransactions() { (transactions, error) in
            
            if error == nil {
                
                if let transactions = transactions {
                    
                    self.transactions = transactions
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        self.accountBalanceLabel.text = self.getLatestAccountBalance()
                        
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
    
    //MARK: - Private Helpers
    
    private func getLatestAccountBalance() -> String? {
        
        guard let latestTransaction = transactions?.first, let balance = latestTransaction.1.first?.post_transaction_balance else {
            
            return ""

        }
        
        return formatAmountWithCurrency(balance)
        
    }
    
    private func formatAmountWithCurrency(amount: Double) -> String? {
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        numberFormatter.locale = NSLocale.currentLocale()
        
        return numberFormatter.stringFromNumber(amount)
    }
    
}

//MARK: - TableView Data Source + Delegate


extension TransactionsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let transactionsCount = transactions?.count else {
            return 0
        }
        
        return transactionsCount
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let transactionsDictionary = transactions?[section] else {
         
            return 0
        }
        
        let listOfTransactions = transactionsDictionary.1
        
        return listOfTransactions.count
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let transactions = self.transactions else {
            return nil
            
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        return dateFormatter.stringFromDate(transactions[section].0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let transactionCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TransactionCell
        
        if let transactions = self.transactions {
            let transactionsDictionary = transactions[indexPath.section]
            
            let listOfTransactions = transactionsDictionary.1
            
            let transaction = listOfTransactions[indexPath.row]
            
            transactionCell.transationTitleLabel.text = transaction.description
            transactionCell.transactionAmountLabel.text = formatAmountWithCurrency(transaction.amount)
 
        }
        
        return transactionCell
    }
}

//MARK: - Transaction Cell


class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var transationTitleLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    
}
