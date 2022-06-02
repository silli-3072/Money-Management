//
//  RegisterViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import Eureka

class RegisterViewController: FormViewController {
    
    let userDefaults = UserDefaults.standard
    
    var incomejudge: String = ""
    var amountofmoney: Int = 0
    
    
    //let day = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
        <<< SegmentedRow<String>("income"){ row in
            row.options = ["支出", "収入"]
            row.value = "支出"
        } .onChange {[unowned self] row in
            self.incomejudge = row.value ?? "選択なし"
            print(self.incomejudge)
            row.value = incomejudge
        }
        
        UserDefaults.standard.bool(forKey: "isIncome")
        
    }
    
    override func didReceiveMemoryWarning(){
        if incomejudge == "支出" {
            form +++ Section()
                <<< DateInlineRow("date"){
                    $0.title = "日付"
                    //$0.value = "Date"
                        
                    UserDefaults.standard.data(forKey: "Date")
            }
            
                <<< PushRow<String>("method"){
                    $0.title = "支払い方法"
                    $0.options = ["現金","キャッシュレス決済","交通ICカード","その他"]
                    $0.value = "現金"
                          
                    UserDefaults.standard.string(forKey: "PaymentMethod")
                    
            }
                
                <<< IntRow("amountofmoney"){
                    $0.title = "金額"
                        
                    UserDefaults.standard.integer(forKey: "Value")
                    
            }
                
                <<< PushRow<String>("classification"){
                    $0.title = "分類"
                    $0.options = ["食費","交通費","交際費","娯楽費","被服費","その他"]
                    $0.value = "食費"
                            
                    UserDefaults.standard.string(forKey: "Group")
            }
        } else if incomejudge == "収入" {
            form +++ Section()
                <<< DateInlineRow("date"){
                    $0.title = "日付"
                    //$0.value = "Date"
                           
                    UserDefaults.standard.data(forKey: "Date")
            }
                    
                <<< PushRow<String>("register"){
                    $0.title = "登録先"
                    $0.options = ["現金","キャッシュレス決済","交通ICカード","その他"]
                    $0.value = "現金"
                            
                    UserDefaults.standard.string(forKey: "Register")
            }
                    
                <<< IntRow("amountofmoney"){
                    $0.title = "金額"
                        
                    userDefaults.set(amountofmoney, forKey: "Value")
                
            }
                    
                <<< PushRow<String>("incomeclassification"){
                    $0.title = "分類"
                    $0.options = ["給料","おこづかい","臨時収入","副業","その他"]
                    $0.value = "給料"
                    
                    UserDefaults.standard.string(forKey: "IncomeGroup")
            }
                    
      
                <<< SwitchRow("switchbutton"){
                    $0.title = "現金残高から引く"
                
            }
                    
        }
        
    }
    
    @IBAction func cancelButton(){
        self.dismiss(animated: true, completion: nil)
        
        UserDefaults.standard.removeObject(forKey: "isIncome")
        UserDefaults.standard.removeObject(forKey: "Date")
        UserDefaults.standard.removeObject(forKey: "PaymentMethod")
        UserDefaults.standard.removeObject(forKey: "Value")
        UserDefaults.standard.removeObject(forKey: "Group")
    }
    
    @IBAction func saveButton(){
        self.dismiss(animated: true, completion: nil)
        
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
