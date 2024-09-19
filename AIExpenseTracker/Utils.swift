//
//  Utils.swift
//  AIExpenseTracker
//
//  Created by P Deepanshu on 15/05/24.
//

import Foundation

struct Utils {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }()
}
