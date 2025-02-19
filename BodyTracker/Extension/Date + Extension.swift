//
//  Date + Extension.swift
//  BodyTracker
//
//  Created by Nikita Putilov on 19.02.2025.
//

import UIKit

extension Date {
    
    func localeDate() -> Date {
        let timeZoneOffset = Double(TimeZone
            .current
            .secondsFromGMT(for: self))
        let localDate = Calendar
            .current
            .date(byAdding: .second,
                  value: Int(timeZoneOffset),
                  to: self) ?? Date()
        return localDate
    }
    
    func getWeekArray() -> [[String]] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru-RU")
        formatter.dateFormat = "EEEEE"
        
        var weekArray: [[String]] = [[], []]
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        
        for index in -6...6 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            let weekday = formatter.string(from: date)
            weekArray[1].append("\(day)")
            weekArray[0].append(weekday)
        }
        
        return weekArray
    }
}
