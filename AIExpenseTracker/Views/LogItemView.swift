//
//  LogItemView.swift
//  AIExpenseTracker
//
//  Created by P Deepanshu on 19/05/24.
//

import SwiftUI

struct LogItemView: View {
    
    let log: ExpenseLog
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        switch horizontalSizeClass {
        case .compact: compactView
        default: regularView
        }
    }
    
    var compactView: some View {
        HStack(spacing: 16) {
            CategoryImageView(category: log.categoryEnum)
            VStack(alignment: .leading, spacing: 8) {
                Text(log.name).font(.headline)
                Text(log.dateText).font(.subheadline)
            }
            Spacer()
            Text(log.amountText).font(.headline)
        }
    }
    
    var regularView: some View {
        VStack {
            HStack(spacing: 16) {
                CategoryImageView(category: log.categoryEnum)
                Spacer()
                Text(log.name)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text(log.amountText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text(log.dateText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text(log.categoryEnum.rawValue)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        ForEach([ExpenseLog(id: "1", name: "Panner", category: "Food", amount: 6, date: .now), ExpenseLog(id: "2", name: "ElecticityBill", category: "utilities", amount: 100, date: .now)]){ log in
            LogItemView(log: log)
        }
    }
    .padding()
}
