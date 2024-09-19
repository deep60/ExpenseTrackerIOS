//
//  Date+Extension.swift
//  AIExpenseTracker
//
//  Created by P Deepanshu on 17/06/24.
//

import Foundation

extension Date {
    
    var startOfDay: Date {
        let calender = Calendar.current
        let startDate = calender.startOfDay(for: self)
        return startDate
    }
    
    var endOfDay: Date {
        let calender = Calendar.current
        var components = DateComponents()
        components.day = 1
        
        let startOfNextDay = calender.date(byAdding: components, to: calender.startOfDay(for: self))!
        let endOfDay = startOfNextDay.addingTimeInterval(-1)
        return endOfDay
    }
}
