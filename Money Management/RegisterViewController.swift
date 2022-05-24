//
//  RegisterViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import Eureka

class RegisterViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section()
        <<< SegmentedRow<String>("income"){
            $0.options = ["支出", "収入"]
            $0.value = "支出"
        }

        form +++ Section()
           <<< DateInlineRow("data"){
                $0.title = "日付"
                //$0.value =  登録日を取得したい
           }.onChange() { row in
                print(row.value!)
        }
        
        form +++ Section()
          <<< PushRow<String>("method"){
              $0.title = "支払い方法"
              $0.options = ["現金","キャッシュレス決済","交通ICカード","その他"]
              $0.value = "現金"
        }
        
        form +++ Section()
            <<< IntRow("amountofmoney"){
                $0.title = "金額"
        }
        
        form +++ Section()
            <<< PushRow<String>("classification"){
                $0.title = "分類"
                $0.options = ["食費","交通費","交際費","娯楽費","被服費","その他"]
                $0.value = "食費"
        }
        
        
    }
    
    @IBAction func cancelButton(){
        self.dismiss(animated: true, completion: nil)
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
