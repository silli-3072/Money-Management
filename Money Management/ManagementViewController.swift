//
//  ManagementViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class ManagementViewController: UIViewController {
    
    
    let calendar = Calendar(identifier: .gregorian)
    let ManagementMonth = Date()
    //let month = Calendar.current.component(.month, from: ManagementMonth)
    
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
        
        //monthLabel.text = month
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Segmented(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            class1Label.text = "食費"
            class2Label.text = "交通費"
            class3Label.text = "交際費"
            class4Label.text = "娯楽費"
            class5Label.text = "その他"
            
        case 1:
            class1Label.text = "給料"
            class2Label.text = "おこづかい"
            class3Label.text = "臨時収入"
            class4Label.text = "副業"
            class5Label.text = "その他"
            
        default:
            print("該当なし")
        }
    }
    
    @IBAction func NextMonthButton(){
       
        
    }
    
    @IBAction func BackMonthButton(){
        
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
