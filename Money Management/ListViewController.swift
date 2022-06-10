//
//  ListViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    @IBOutlet var ListMoneyLabell1: UILabel!
    @IBOutlet var ListMoneyLabell2: UILabel!
    @IBOutlet var ListMoneyLabell3: UILabel!
    @IBOutlet var ListMoneyLabell4: UILabel!
    @IBOutlet var ListMoneyLabell5: UILabel!
    
    let realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let SpendingDay = realm.objects(StorageSpending.self).filter("id = '1'").first
        let PaymentMethod = realm.objects(StorageSpending.self).filter("id = '1'").first
        let PullValue = realm.objects(StorageSpending.self).filter("id = '1'").first
        let Group = realm.objects(StorageSpending.self).filter("id = '1'").first
        
        let IncomeDay = realm.objects(StorageIncome.self).filter("id = '1'").first
        let IncomeMethod = realm.objects(StorageIncome.self).filter("id = '1'").first
        let AddValue = realm.objects(StorageIncome.self).filter("id = '1'").first
        let IncomeGroup = realm.objects(StorageIncome.self).filter("id = '1'").first
        
        try! realm.write {
            
        }
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
