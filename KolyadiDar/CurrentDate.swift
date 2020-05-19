//
//  CurrentDate.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 13.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import Foundation

class CurrentDate {
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    func getCurrentYear() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        return year
    }
    
    func getCurrentMonth() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate)
        return month
    }
    
    func getCurrentDay() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: currentDate)
        return day
    }
    
    func getCurrentHours() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        return hour
    }
    
    func getCurrentMinutes() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: currentDate)
        return minutes
    }
    
    func getCurrentSeconds() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: currentDate)
        return seconds
    }
    
    func getCurrentNanoseconds() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        let nanosecond = calendar.component(.nanosecond, from: currentDate)
        return nanosecond
    }

    func getCurrentDate() -> String {
        // получаем текущую дату в формате Date
        let currentDate = Date()
        // Получение даты и выведение ее в формате String
        dateFormatter.dateStyle = .full
        let currentDateString = dateFormatter.string(from: currentDate)
        return currentDateString
    }
    
    func getDifferenceTime(year: Int, month: Int, day: Int, hour: Int) -> Int {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        let dateFromDC = calendar.date(from: dateComponents as DateComponents)
        let difference = Int(-((dateFromDC?.timeIntervalSinceNow)!))
        return difference
    }
}
