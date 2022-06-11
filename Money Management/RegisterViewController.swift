//
//  RegisterViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
    
    @IBOutlet var chargeselect: UISwitch!
    
    let methoddataList = ["現金","キャッシュレス","交通ICカード","その他"]
    let SpendingClassdataList = ["食費","交通費","交際費","娯楽費","その他"]
    let IncomeClassdataList = ["給料","お小遣い","臨時収入","副業","その他"]
    
    let realm = try! Realm()
    
    let incomeClassPickerViewSelectedRow:Int = 0
    
    //letをvarにするとピッカー選択の値取得する部分のエラーが消える。
    //どうして質問時はletでエラーが出なかった？
    var methodPickerViewSelectedRow = 0
    var groupPickerViewSelectedRow = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テキストフィールドの右詰を指定
        moneyTextField.textAlignment = NSTextAlignment.right
        
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
            SpendingClassPickerView.isHidden = false
            
            
            
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        methodPickerViewSelectedRow = row
        
        groupPickerViewSelectedRow = row
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBAction func cancelButton(){
        self.dismiss(animated: true, completion: nil)
        
        
        let SpendingDay = realm.objects(StorageSpending.self).filter("id = '1'")
        let PaymentMethod = realm.objects(StorageSpending.self).filter("id = '1'")
        let PullValue = realm.objects(StorageSpending.self).filter("id = '1'")
        let Group = realm.objects(StorageSpending.self).filter("id = '1'")
        
        let IncomeDay = realm.objects(StorageIncome.self).filter("id = '1'")
        let IncomeMethod = realm.objects(StorageIncome.self).filter("id = '1'")
        let AddValue = realm.objects(StorageIncome.self).filter("id = '1'")
        let IncomeGroup = realm.objects(StorageIncome.self).filter("id = '1'")
        
        try! realm.write {
            realm.delete(SpendingDay)
            realm.delete(PaymentMethod)
            realm.delete(PullValue)
            realm.delete(Group)
            
            realm.delete(IncomeDay)
            realm.delete(IncomeMethod)
            realm.delete(AddValue)
            realm.delete(IncomeGroup)
        }
        
    }
    
    @IBAction func saveButton(){
        self.dismiss(animated: true, completion: nil)
        
        //収入画面か支出画面かで条件分岐
        saveSpending()
        saveIncome()
        Switch()
        
    }
   
    func saveSpending(){
        let paymentS = StorageSpending()
        //日付
        paymentS.SpendingDay = DatePicker.date
        //方法
        paymentS.PaymentMethod = String(methodPickerViewSelectedRow)
        //金額
        guard let value = moneyTextField.text else { return  }
        paymentS.PullValue = Int(value) ?? 0
        //分類
        paymentS.Group = String(groupPickerViewSelectedRow)
        
        try! realm.write({realm.add(paymentS)})
    }
    
    func saveIncome(){
        let paymentI = StorageIncome()
        //日付
        paymentI.IncomeDay = DatePicker.date
        //方法
        paymentI.IncomeMethod = String(methodPickerViewSelectedRow)
        //金額(Int型で保存したけどエラーが出るのでStringで保存中)
        guard let value = moneyTextField.text else { return  }
        paymentI.AddValue = Int(value) ?? 0
        //分類
        paymentI.IncomeGroup = String(groupPickerViewSelectedRow)
        
        try! realm.write({realm.add(paymentI)})
    }
    
    //どこで実行？
    func Switch(){
        if chargeselect.isOn == false{
            //現金残高からマイナス
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
