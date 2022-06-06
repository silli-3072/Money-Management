//
//  RegisterViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var ClassificationLabel1: UILabel!
    @IBOutlet var ClassificationLabel2: UILabel!
    @IBOutlet var ClassificationLabel3: UILabel!
    @IBOutlet var ClassificationLabel4: UILabel!
    @IBOutlet var ClassificationLabel5: UILabel!
    
    @IBOutlet var moneyTextField: UITextField!
    
    @IBOutlet var MethodPickerView: UIPickerView!
    @IBOutlet var IncomeClassPickerView: UIPickerView!
    
    @IBOutlet var SpendingClassPickerView: UIPickerView!
    
    @IBOutlet var DatePicker:UIDatePicker!
    
    let methoddataList = ["現金","キャッシュレス","交通ICカード","その他"]
    let SpendingClassdataList = ["食費","交通費","交際費","娯楽費","その他"]
    let IncomeClassdataList = ["給料","お小遣い","臨時収入","副業","その他"]
    
    
    @IBOutlet var chargeselect: UISwitch!
    
    let defaults: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MethodPickerView.delegate = self
        MethodPickerView.dataSource = self
        
        SpendingClassPickerView.delegate = self
        SpendingClassPickerView.dataSource = self
        
        IncomeClassPickerView.delegate = self
        IncomeClassPickerView.dataSource = self
        
        ClassificationLabel5.isHidden = true
        chargeselect.isHidden = true
        IncomeClassPickerView.isHidden = true
        
        moneyTextField.keyboardType = UIKeyboardType.numberPad
        
        moneyTextField.delegate = self
        
    }
    
    //キーボード以外をタップすることでキーボードを閉じるコード
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Segmented(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            ClassificationLabel1.text = "日付"
            ClassificationLabel2.text = "支払い方法"
            ClassificationLabel3.text = "金額"
            ClassificationLabel4.text = "分類"
            
            ClassificationLabel5.isHidden = true
            chargeselect.isHidden = true
            IncomeClassPickerView.isHidden = true
            
        case 1:
            ClassificationLabel1.text = "日付"
            ClassificationLabel2.text = "登録先"
            ClassificationLabel3.text = "金額"
            ClassificationLabel4.text = "分類"
            ClassificationLabel5.text = "現金残高から引く"
            
            ClassificationLabel5.isHidden = false
            chargeselect.isHidden = false
            IncomeClassPickerView.isHidden = false
            SpendingClassPickerView.isHidden = true
            
            
        default:
            print("該当なし")
        }
    }
    
    
    
    func MethodPickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == MethodPickerView {
            return methoddataList.count
        }
        if pickerView == IncomeClassPickerView {
            return IncomeClassdataList.count
        }
        if pickerView == SpendingClassPickerView {
            return SpendingClassdataList.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == MethodPickerView {
            return methoddataList[row]
        }
        if pickerView == IncomeClassPickerView {
            return IncomeClassdataList[row]
        }
        if pickerView == SpendingClassPickerView {
            return SpendingClassdataList[row]
        }
        
        return nil
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func addmoneytext(_ sender: Any){
        let writtenmoney = moneyTextField.text! as NSString
        let defaults = UserDefaults.standard
        defaults.set(writtenmoney, forKey: "AddValue")
        view.endEditing(true)
        
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
