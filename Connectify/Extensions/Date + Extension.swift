//
//  Date + Extension.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 13.07.23.
//

import Foundation

extension Date {
    func toString() -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            return "today, \(self.toString(format: "HH:mm"))"
        } else if calendar.isDateInYesterday(self) {
            return "yesterday, \(self.toString(format: "HH:mm"))"
        } else {
            return self.toString(format: "yyyy-MM-dd HH:mm")
        }
    }

    private func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
