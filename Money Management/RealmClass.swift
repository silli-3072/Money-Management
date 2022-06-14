//
//  RealmClass.swift
//  Money Management
//
//  Created by 春田実利 on 2022/06/08.
//

import Foundation
import RealmSwift

class StorageSpending: Object{
    @objc dynamic var SpendingDay = ""
    @objc dynamic var PaymentMethod = ""
    @objc dynamic var PullValue: Int = 0
    @objc dynamic var Group = ""
    
}

class StorageIncome: Object{
    @objc dynamic var IncomeDay = ""
    @objc dynamic var IncomeMethod = ""
    @objc dynamic var AddValue: Int = 0
    @objc dynamic var IncomeGroup = ""
    
}
