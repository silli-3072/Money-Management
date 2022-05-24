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
            <<< TextRow("data"){
                $0.title = "日付"
                $0.placeholder = "ここに書いてね"
        }
        
        form +++ Section()
            <<< TextRow("method"){
                $0.title = "支払い方法"
                $0.placeholder = "ここに書いてね"
        }
        
        form +++ Section()
            <<< TextRow("amountofmoney"){
                $0.title = "金額"
                $0.placeholder = "ここに書いてね"
        }
        
        form +++ Section()
            <<< TextRow("classification"){
                $0.title = "分類"
                $0.placeholder = "ここに書いてね"
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
