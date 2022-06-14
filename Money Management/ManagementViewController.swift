//
//  ManagementViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class ManagementViewController: UIViewController {
    
    
    //let calendar = Calendar(identifier: .gregorian)
    //let date = Date()
    //let year = Calendar.current.component(.year, from: date)
    //let month = calendar.current.component(.month, from: date)
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var class1Label: UILabel!
    @IBOutlet var class2Label: UILabel!
    @IBOutlet var class3Label: UILabel!
    @IBOutlet var class4Label: UILabel!
    @IBOutlet var class5Label: UILabel!
    @IBOutlet var totalmoneyLabel: UILabel!
    @IBOutlet var moneyclass1Label: UILabel!
    @IBOutlet var moneyclass2Label: UILabel!
    @IBOutlet var moneyclass3Label: UILabel!
    @IBOutlet var moneyclass4Label: UILabel!
    @IBOutlet var moneyclass5Label: UILabel!
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setmoney()
        
        //monthLabel.text = month
    
    }
    
    override func viewWillAppear(_ animated: Bool){
        setmoney()
        
    }
    
    @IBAction func Segmented(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            //選択肢
            class1Label.text = "食費"
            class2Label.text = "交通費"
            class3Label.text = "交際費"
            class4Label.text = "娯楽費"
            class5Label.text = "その他"
            
            //金額
            moneyclass1Label.text = ""
            moneyclass2Label.text = ""
            moneyclass3Label.text = ""
            moneyclass4Label.text = ""
            moneyclass5Label.text = ""
            
            
        case 1:
            //選択肢
            class1Label.text = "給料"
            class2Label.text = "おこづかい"
            class3Label.text = "臨時収入"
            class4Label.text = "副業"
            class5Label.text = "その他"
            
            //金額
            moneyclass1Label.text = ""
            moneyclass2Label.text = ""
            moneyclass3Label.text = ""
            moneyclass4Label.text = ""
            moneyclass5Label.text = ""
            
        default:
            print("該当なし")
        }
    }
    
    @IBAction func NextMonthButton(){
       
        
    }
    
    @IBAction func BackMonthButton(){
        
    }
    
    func setmoney(){
        
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
