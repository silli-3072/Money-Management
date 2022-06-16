//
//  ManagementViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit
import RealmSwift

class ManagementViewController: UIViewController {
    
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
    
    @IBOutlet var segmented: UISegmentedControl!
    
    var month = Date()
    
    let realm = try! Realm()
    
    var pullResults:Results<StorageSpending>!
    var addResults:Results<StorageIncome>!
    
    var syokuhiSum = 0
    var koutuuhiSum = 0
    var kousaihiSum = 0
    var gorakuhiSum = 0
    var othersSum = 0
    
    var kyuryouSum = 0
    var okozukaiSum = 0
    var rinziSum = 0
    var hukugyouSum = 0
    var incomeOthersSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMonth()
        setmoney()
        checkSegment()
    }
    
    override func viewWillAppear(_ animated: Bool){
        getMonth()
        setmoney()
        checkSegment()
        
    }
    
    @IBAction func SegmentedTapped(sender: UISegmentedControl){
        checkSegment()
    }
    
    @IBAction func NextMonthButton(){
        setNextMonth()
        setmoney()
        
    }
    
    @IBAction func BackMonthButton(){
        setLastMonth()
        setmoney()
        
    }
    
    func setmoney(){
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy年M月", options: 0, locale: Locale(identifier:"ja_JP"))
        print("@@@",formatter.string(from: month))
        let predicatd = NSPredicate(format: "SpendingDay CONTAINS %@", formatter.string(from: month))
        pullResults = realm.objects(StorageSpending.self).filter(predicatd)
        
        let incomePredicatd = NSPredicate(format: "IncomeDay CONTAINS %@", formatter.string(from: month))
        addResults = realm.objects(StorageIncome.self).filter(incomePredicatd)
        
        print("###",pullResults)
        if formatter.string(from: month).contains("/10") { // -> true
            monthLabel.text = "10月"
        }else if formatter.string(from: month).contains("/11") { // -> true
            monthLabel.text = "11月"
        }else if formatter.string(from: month).contains("/12") { // -> true
            monthLabel.text = "12月"
        }else if formatter.string(from: month).contains("/1") { // -> true
            monthLabel.text = "1月"
        }else if formatter.string(from: month).contains("/2") { // -> true
            monthLabel.text = "2月"
        }else if formatter.string(from: month).contains("/3") { // -> true
            monthLabel.text = "3月"
        }else if formatter.string(from: month).contains("/4") { // -> true
            monthLabel.text = "4月"
        }else if formatter.string(from: month).contains("/5") { // -> true
            monthLabel.text = "5月"
        }else if formatter.string(from: month).contains("/6") { // -> true
            monthLabel.text = "6月"
        }else if formatter.string(from: month).contains("/7") { // -> true
            monthLabel.text = "7月"
        }else if formatter.string(from: month).contains("/8") { // -> true
            monthLabel.text = "8月"
        }else if formatter.string(from: month).contains("/9") { // -> true
            monthLabel.text = "9月"
        }
    }
    
    func getMonth() {
        let date = Date()
        month = date
        
    }
    
    func setNextMonth(){
        let date = month
        let modifiedDate = Calendar.current.date(byAdding: .month,value: 1, to: date)!
        
        month = modifiedDate
        
        checkSegment()
    }
    
    func setLastMonth(){
        let date = month
        let modifiedDate = Calendar.current.date(byAdding: .month,value: -1, to: date)!
        
        month = modifiedDate
        
        checkSegment()
    }
    
    func sumSpending(){
        for i in 0..<pullResults.count{
            let item:StorageSpending = self.pullResults[i]
            if item.PaymentMethod == "0"{
                syokuhiSum += item.PullValue
            } else if item.PaymentMethod == "1" {
                koutuuhiSum += item.PullValue
            } else if item.PaymentMethod == "2" {
                kousaihiSum += item.PullValue
            } else if item.PaymentMethod == "3" {
                gorakuhiSum += item.PullValue
            } else if item.PaymentMethod == "4"{
                othersSum += item.PullValue
            }
        }
    }
    
    func sumIncome(){
        for i in 0..<addResults.count{
            let item:StorageIncome = self.addResults[i]
            
            if item.IncomeMethod == "0"{
                kyuryouSum += item.AddValue
            } else if item.IncomeMethod == "1" {
                okozukaiSum += item.AddValue
            } else if item.IncomeMethod == "2" {
                rinziSum += item.AddValue
            } else if item.IncomeMethod == "3" {
                hukugyouSum += item.AddValue
            } else if item.IncomeMethod == "4" {
                incomeOthersSum += item.AddValue
            }
            
        }
    }
        
        func viewSumSpending(){
            sumSpending()
            
            let spendingAll = syokuhiSum + koutuuhiSum + kousaihiSum + gorakuhiSum + othersSum
            
            totalLabel.text = "\(spendingAll)円"
            moneyclass1Label.text = "\(syokuhiSum)円"
            moneyclass2Label.text = "\(koutuuhiSum)円"
            moneyclass3Label.text = "\(kousaihiSum)円"
            moneyclass4Label.text = "\(gorakuhiSum)円"
            moneyclass5Label.text = "\(othersSum)円"
            
            syokuhiSum = 0
            kousaihiSum = 0
            koutuuhiSum = 0
            gorakuhiSum = 0
            othersSum = 0
        }
        
        func viewSumIncome(){
            sumIncome()
            
            let incomeAll = kyuryouSum + okozukaiSum + rinziSum + hukugyouSum + incomeOthersSum
            
            totalLabel.text = "\(incomeAll)円"
            moneyclass1Label.text = "\(kyuryouSum)円"
            moneyclass2Label.text = "\(okozukaiSum)円"
            moneyclass3Label.text = "\(rinziSum)円"
            moneyclass4Label.text = "\(hukugyouSum)円"
            moneyclass5Label.text = "\(incomeOthersSum)円"
            
            kyuryouSum = 0
            okozukaiSum = 0
            rinziSum = 0
            hukugyouSum = 0
            incomeOthersSum = 0
        }
        
    
    
    func checkSegment(){
        switch segmented.selectedSegmentIndex{
        case 0:
            //選択肢
            class1Label.text = "食費"
            class2Label.text = "交通費"
            class3Label.text = "交際費"
            class4Label.text = "娯楽費"
            class5Label.text = "その他"
            
            viewSumSpending()
            
            
        case 1:
            //選択肢
            class1Label.text = "給料"
            class2Label.text = "おこづかい"
            class3Label.text = "臨時収入"
            class4Label.text = "副業"
            class5Label.text = "その他"
            
            viewSumIncome()
            
        default:
            print("該当なし")
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
