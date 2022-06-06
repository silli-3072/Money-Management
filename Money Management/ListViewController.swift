//
//  ListViewController.swift
//  Money Management
//
//  Created by 春田実利 on 2022/05/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var ListMoneyLabell1: UILabel!
    @IBOutlet var ListMoneyLabell2: UILabel!
    @IBOutlet var ListMoneyLabell3: UILabel!
    @IBOutlet var ListMoneyLabell4: UILabel!
    @IBOutlet var ListMoneyLabell5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey: "AddValue")
        ListMoneyLabell1.text = value
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
