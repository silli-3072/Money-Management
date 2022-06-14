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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyText()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moneyText()
        
        //支出
        //現金
        let pullresultsCash = realm.objects(StorageSpending.self).filter{$0.PaymentMethod == "0"}
        print(pullresultsCash)
        //キャッシュレス
        let pullresultsCashless = realm.objects(StorageSpending.self).filter{$0.PaymentMethod == "1"}
        print(pullresultsCashless)
        //交通ICカード
        let pullresultsIcCard = realm.objects(StorageSpending.self).filter{$0.PaymentMethod == "2"}
        print(pullresultsIcCard)
        //その他
        let pullresultsothers = realm.objects(StorageSpending.self).filter{$0.PaymentMethod == "3"}
        print(pullresultsothers)
        
        //支出
        //現金
        let addresultsCash = realm.objects(StorageIncome.self).filter{$0.IncomeMethod == "0"}
        print(addresultsCash)
        //キャッシュレス
        let addresultsCashless = realm.objects(StorageIncome.self).filter{$0.IncomeMethod == "1"}
        print(addresultsCashless)
        //交通ICカード
        let addresultsIcCard = realm.objects(StorageIncome.self).filter{$0.IncomeMethod == "2"}
        print(addresultsIcCard)
        //その他
        let addresultsothers = realm.objects(StorageIncome.self).filter{$0.IncomeMethod == "3"}
        print(addresultsothers)
        
    }
    
    func moneyText(){
        
    }

}
