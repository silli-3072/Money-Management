//
//  ListViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    @IBOutlet var listMoneyLabell1: UILabel!
    @IBOutlet var listMoneyLabell2: UILabel!
    @IBOutlet var listMoneyLabell3: UILabel!
    @IBOutlet var listMoneyLabell4: UILabel!
    @IBOutlet var listMoneyLabell5: UILabel!
    
    let realm = try! Realm()
    
    let paymentS = RegisterViewController()
    let paymentI = RegisterViewController()
    
    let PaymentMethod = RegisterViewController()
    let IncomeMethod = RegisterViewController()
    
    var pullResults:Results<StorageSpending>!
    var addResults:Results<StorageIncome>!
    
    var cashSum = 0
    var cachlessSum = 0
    var icCardSum = 0
    var othersSum = 0
    
    var incomecashSum = 0
    var incomecachlessSum = 0
    var incomeicCardSum = 0
    var incomeothersSum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pullResults = realm.objects(StorageSpending.self)
        addResults = realm.objects(StorageIncome.self)
        
        labelview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pullResults = realm.objects(StorageSpending.self)
        addResults = realm.objects(StorageIncome.self)
        
       labelview()
        
        print("💔",pullResults)
    }

    func someValue(){
        for i in 0..<pullResults.count{
            let item:StorageSpending = self.pullResults[i]
            if item.PaymentMethod == "0"{
                cashSum -= item.PullValue
            } else if item.PaymentMethod == "1" {
                cachlessSum -= item.PullValue
            } else if item.PaymentMethod == "2" {
                icCardSum -= item.PullValue
            } else if item.PaymentMethod == "3" {
                othersSum -= item.PullValue
            }
        }
        
        print("😅",cashSum)
        print("💤",cachlessSum)
        print("💨",icCardSum)
        print("📩",othersSum)
        
    }
    
    func incomeValue(){
        for i in 0..<addResults.count{
            let item:StorageIncome = self.addResults[i]
            
            if item.IncomeMethod == "0"{
                incomecashSum += item.AddValue
            } else if item.IncomeMethod == "1" {
                incomecachlessSum += item.AddValue
            } else if item.IncomeMethod == "2" {
                incomeicCardSum += item.AddValue
            } else if item.IncomeMethod == "3" {
                incomeothersSum += item.AddValue
            }
            
        }
        
        print("👍",incomecashSum)
        print("☀️",incomecachlessSum)
        print("🎤",incomeicCardSum)
        print("🎂",incomeothersSum)
        
    }
    
    func labelview(){
        someValue()
        incomeValue()
        
        let incometotal = incomecashSum + incomecachlessSum + incomeicCardSum + incomeothersSum
        let spendingtotal = cashSum + cachlessSum + icCardSum + othersSum
        let total = incometotal + spendingtotal
        
        
        listMoneyLabell1.text = "\(total)円"
        listMoneyLabell2.text = "\(incomecashSum + cashSum)円"
        listMoneyLabell3.text = "\(incomecachlessSum + cachlessSum)円"
        listMoneyLabell4.text = "\(incomeicCardSum + icCardSum)円"
        listMoneyLabell5.text = "\(incomeothersSum + othersSum)円"
        
        
        cashSum = 0
        cachlessSum = 0
        icCardSum = 0
        othersSum = 0
        
        incomecashSum = 0
        incomecachlessSum = 0
        incomeicCardSum = 0
        incomeothersSum = 0
        
    }
    
}
