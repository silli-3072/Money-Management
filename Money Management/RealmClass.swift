//
//  RealmClass.swift
//  Money Management
//
//  Created by 春田実利 on 2022/06/08.
//

import Foundation
import RealmSwift

class StorageSpending: Object{
    @objc dynamic var SpendingDay = Date()
    @objc dynamic var PaymentMethod: String = ""
    @objc dynamic var AddValue: Int = 0
    @objc dynamic var Group: String = ""
    
}

class StorageIncome: Object{
    @objc dynamic var IncomeDay = Date()
    @objc dynamic var PaymentMethod: String = ""
    @objc dynamic var AddValue: Int = 0
    @objc dynamic var IncomeGroup: String = ""
    
}
