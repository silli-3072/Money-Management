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
        let pullresultsCash = realm.objects(StorageSpending.self).filter(PaymentMethod == 0)
        //キャッシュレス
        let pullresultsCashless = realm.objects(StorageSpending.self).filter(PaymentMethod == 1)
        //交通ICカード
        let pullresultsIcCard = realm.objects(StorageSpending.self).filter(PaymentMethod == 2)
        //その他
        let pullresultsothers = realm.objects(StorageSpending.self).filter(PaymentMethod == 3)
        
        //支出
        //現金
        let addresultsCash = realm.objects(StorageIncome.self).filter(IncomeMethod == 0)
        //キャッシュレス
        let addresultsCashless = realm.objects(StorageIncome.self).filter(IncomeMethod == 1)
        //交通ICカード
        let addresultsIcCard = realm.objects(StorageIncome.self).filter(IncomeMethod == 2)
        //その他
        let addresultsothers = realm.objects(StorageIncome.self).filter(IncomeMethod == 3)
        
    }
    
    func moneyText(){
        
    }

}
