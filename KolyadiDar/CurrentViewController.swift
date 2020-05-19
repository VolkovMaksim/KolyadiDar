//
//  CurrentViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 06.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var sepLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var letoLabel: UILabel!
    @IBOutlet weak var numberOfYear: UILabel!
    @IBOutlet weak var titleOfYear: UILabel!
    
    @IBOutlet weak var titleOfHour: UILabel!
    @IBOutlet weak var fullTitleOfHour: UILabel!
    @IBOutlet weak var periodOfDay: UILabel!
    @IBOutlet weak var titleOfConstellation: UILabel!
    
    @IBOutlet weak var holidayLabel: UILabel!
    
    var currentDate = CurrentDate()
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dayLabel.text = "\(41)"
//        let calendar = Calendar.current
//        var dateComponents = DateComponents()
//        dateComponents.year = 2019
//        dateComponents.month = 9
//        dateComponents.day = 22
//        let dateFromDC = calendar.date(from: dateComponents as DateComponents)
//        let timeInterval = Int(-((dateFromDC?.timeIntervalSinceNow)!)) / 60 / 60 / 24
//
        //print("Year \(year), month \(month), day \(day), hour \(hour), minute \(minute), second \(second), nanosecond \(nanosecond)")
        //print(timeInterval)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func oldTime(hour: Int, minute: Int, second: Int) {
        // годины, части, доли
        if hour <= 18 {
            let time = (hour + 6) * 3600 + minute * 60 + second
            let oldH = Int(time / 5400)
            let oldM = Int(Double(time - (oldH * 5400))/37.5)
            let oldS = Int((Double(time) - Double(oldH) * 5400 - Double(oldM) * 37.5) / 0.05787 * 2)
            
            if oldH < 10 {
                hourLabel.text = "0\(oldH)"
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
            }
            
            if oldM < 10 {
                minuteLabel.text = "00\(oldM)"
            } else if oldM >= 10 && oldM < 100 {
                minuteLabel.text = "0\(oldM)"
            } else if oldM >= 100 {
                minuteLabel.text = "\(oldM)"
            }
            
            if oldS < 10 {
                secondLabel.text = ".000\(oldS)"
            } else if oldS >= 10 && oldS < 100 {
                secondLabel.text = ".00\(oldS)"
            } else if oldS >= 100 && oldS < 1000 {
                secondLabel.text = ".0\(oldS)"
            } else if oldS >= 1000 {
                secondLabel.text = ".\(oldS)"
            }
        } else if hour > 18 {
            let time = (hour - 18) * 3600 + minute * 60 + second
            var oldH = Int(time / 5400)
            let oldM = Int(Double(time - (oldH * 5400))/37.5)
            let oldS = Int((Double(time) - Double(oldH) * 5400 - Double(oldM) * 37.5) / 0.05787 * 2)
            if time < 5400 {
                oldH = 16
            }
            
            if oldH < 10 {
                hourLabel.text = "0\(oldH)"
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
            }
            
            if oldM < 10 {
                minuteLabel.text = "00\(oldM)"
            } else if oldM >= 10 && oldM < 100 {
                minuteLabel.text = "0\(oldM)"
            } else if oldM >= 100 {
                minuteLabel.text = "\(oldM)"
            }
            
            if oldS < 10 {
                secondLabel.text = ".000\(oldS)"
            } else if oldS >= 10 && oldS < 100 {
                secondLabel.text = ".00\(oldS)"
            } else if oldS >= 100 && oldS < 1000 {
                secondLabel.text = ".0\(oldS)"
            } else if oldS >= 1000 {
                secondLabel.text = ".\(oldS)"
            }
        }
    }
    
    func oldMonth(oldYearsNumber: Int, year: Int, month: Int, day: Int, hour: Int) {
        if oldYearsNumber >= 1 && oldYearsNumber <= 3 {
            
            
            
            
            
//            if (month >= 12 && day >= 12 && hour >= 18)  {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 11 && day >= 2 && hour >= 18)  {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 12 && hour >= 18)  {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && day >= 3 && hour >= 18)  {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 23 && hour >= 18)  {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 13 && hour >= 18)  {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && day >= 3 && hour >= 18)  {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 22 && hour >= 18)  {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber == 4 {
            
            
            
            
//            if (month >= 12 && day >= 12 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 11 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 11 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 12 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber >= 5 && oldYearsNumber <= 7 {
            
            
            
            
//            if (month >= 12 && day >= 11 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 11 && day >= 1 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 21 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 11 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 12 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 21 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber == 8 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 20 && hour <= 18) || day < 20 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 21
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            
            if oldMonth == 1 {
                monthLabel.text = "Рамхатъ"
            } else if oldMonth == 2 {
                monthLabel.text = "Айлѣтъ"
            } else if oldMonth == 3 {
                monthLabel.text = "Бейлѣтъ"
            } else if oldMonth == 4 {
                monthLabel.text = "Гэйлѣтъ"
            } else if oldMonth == 5 {
                monthLabel.text = "Дайлѣтъ"
            } else if oldMonth == 6 {
                monthLabel.text = "Элѣтъ"
            } else if oldMonth == 7 {
                monthLabel.text = "Вэйлѣтъ"
            } else if oldMonth == 8 {
                monthLabel.text = "Хейлѣтъ"
            } else if oldMonth == 9 {
                monthLabel.text = "Тайлѣтъ"
            }
            
//            if (month >= 12 && ((day >= 11 && hour >= 18) || (day >= 12 && hour >= 00))) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 11 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 10) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 9 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && ((day >= 10 && hour >= 18) || (day >= 11 && hour >= 00))) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 6 ) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 5 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && ((day >= 11 && hour >= 18) || (day >= 12 && hour >= 00))) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 2) {
//                monthLabel.text = "Гэйлѣтъ"
//            } else if (month >= 1 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
            
        else if oldYearsNumber >= 9 && oldYearsNumber <= 11 {
//            if (month >= 12 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 10 && day >= 31 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && day >= 1 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 21 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 11 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && day >= 1 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber == 12 {
//            if (month >= 12 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 10 && day >= 31 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 9 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 6 && day >= 30 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 2 && day >= 29 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber >= 13 && oldYearsNumber <= 15 {
//            if (month >= 12 && day >= 9 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 10 && day >= 30 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 19 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 9 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 6 && day >= 30 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 2 && day >= 28 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 19 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
        else if oldYearsNumber == 0 || oldYearsNumber == 16 {
//            if (month >= 12 && day >= 10 && hour >= 18) {
//                monthLabel.text = "Бейлѣтъ"
//            } else if (month >= 10 && day >= 30 && hour >= 18) {
//                monthLabel.text = "Айлѣтъ"
//            } else if (month >= 9 && day >= 19 && hour >= 18) {
//                monthLabel.text = "Рамхатъ"
//            } else if (month >= 8 && day >= 12 && hour >= 18) {
//                monthLabel.text = "Тайлѣтъ"
//            } else if (month >= 7 && day >= 2 && hour >= 18) {
//                monthLabel.text = "Хейлѣтъ"
//            } else if (month >= 5 && day >= 22 && hour >= 18) {
//                monthLabel.text = "Вэйлѣтъ"
//            } else if (month >= 4 && day >= 11 && hour >= 18) {
//                monthLabel.text = "Элѣтъ"
//            } else if (month >= 3 && day >= 1 && hour >= 18) {
//                monthLabel.text = "Дайлѣтъ"
//            } else if (month >= 1 && day >= 20 && hour >= 18) {
//                monthLabel.text = "Гэйлѣтъ"
//            }
        }
    }
    
    func nameOfHour() {
        if hourLabel.text == "16" {
            titleOfHour.text = "ПОѸДАНИ"
            fullTitleOfHour.text = "Завершенный день"
            periodOfDay.text = "Вѣчеръ"
        } else if hourLabel.text == "01" {
            titleOfHour.text = "ПAOБѢДЪ"
            fullTitleOfHour.text = "Начало нового дня"
            periodOfDay.text = "Вѣчеръ"
        } else if hourLabel.text == "02" {
            titleOfHour.text = "ВѢЧИРЪ"
            fullTitleOfHour.text = "Появление звездной росы на Небесах"
            periodOfDay.text = "Вѣчеръ"
        } else if hourLabel.text == "03" {
            titleOfHour.text = "НИЧЬ"
            fullTitleOfHour.text = "Нечетное время трех Лун"
            periodOfDay.text = "Вѣчеръ"
        } else if hourLabel.text == "04" {
            titleOfHour.text = "ПОЛНИЧЬ"
            fullTitleOfHour.text = "Полный путь Лун"
            periodOfDay.text = "Ночь"
        } else if hourLabel.text == "05" {
            titleOfHour.text = "ЗАѸТРА"
            fullTitleOfHour.text = "Звездное утешение росы"
            periodOfDay.text = "Ночь"
        } else if hourLabel.text == "06" {
            titleOfHour.text = "ЗАѸРА"
            fullTitleOfHour.text = "Звездное сияние, заря"
            periodOfDay.text = "Ночь"
        } else if hourLabel.text == "07" {
            titleOfHour.text = "ЗАѸРНИЦЕ"
            fullTitleOfHour.text = "Окончание звездного сияния"
            periodOfDay.text = "Ночь"
        } else if hourLabel.text == "08" {
            titleOfHour.text = "НАСТѦ"
            fullTitleOfHour.text = "Утренная роса"
            periodOfDay.text = "Утро"
        } else if hourLabel.text == "09" {
            titleOfHour.text = "СВАОРЪ"
            fullTitleOfHour.text = "Восход Солнца"
            periodOfDay.text = "Утро"
        } else if hourLabel.text == "10" {
            titleOfHour.text = "УТРОСЬ"
            fullTitleOfHour.text = "Успокоение росы"
            periodOfDay.text = "Утро"
        } else if hourLabel.text == "11" {
            titleOfHour.text = "ПОѸТРОСЬ"
            fullTitleOfHour.text = "Путь собирания успокоенной росы"
            periodOfDay.text = "Утро"
        } else if hourLabel.text == "12" {
            titleOfHour.text = "ОБЕСТНА"
            fullTitleOfHour.text = "Обедня, совместное собрание"
            periodOfDay.text = "Дѣнь"
        } else if hourLabel.text == "13" {
            titleOfHour.text = "ОБЕДЪ (ОБЕСТЬ)"
            fullTitleOfHour.text = "Трапеза"
            periodOfDay.text = "Дѣнь"
        } else if hourLabel.text == "14" {
            titleOfHour.text = "ПОДАНИ"
            fullTitleOfHour.text = "Отдых после трапезы"
            periodOfDay.text = "Дѣнь"
        } else if hourLabel.text == "15" {
            titleOfHour.text = "УТДАЙНИ"
            fullTitleOfHour.text = "Время окончания деяний"
            periodOfDay.text = "Дѣнь"
        }
    }
    
    func oldYearAndTime() {
        let hour = currentDate.getCurrentHours()
        //let hour = 18
        let minute = currentDate.getCurrentMinutes()
        let second = currentDate.getCurrentSeconds()
        let year = currentDate.getCurrentYear()
        let month = currentDate.getCurrentMonth()
        //let month = 1
        let day = currentDate.getCurrentDay()
        //let day = 20
        
        if month >= 1 && month <= 9 {
            var oldY = year + 5508
            var oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            if month == 9 {
                if oldYearsNumber >= 0 && oldYearsNumber <= 3 {
                    if (day == 22 && hour >= 18) ||  day > 22 {
                        oldY += 1
                        oldYearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 22 && hour <= 18) || day < 22 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 4 && oldYearsNumber <= 7 {
                    if (day == 21 && hour >= 18) ||  day > 21 {
                        oldY += 1
                        oldYearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 21 && hour <= 18) || day < 21 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 8 && oldYearsNumber <= 11 {
                    if (day == 20 && hour >= 18) ||  day > 20 {
                        oldY += 1
                        oldYearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 20 && hour <= 18) || day < 20 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 12 && oldYearsNumber == 15 {
                    if (day == 19 && hour >= 18) ||  day > 19 {
                        oldY += 1
                        oldYearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 19 && hour <= 18) || day < 19 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(oldYearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                }
            }
            letoLabel.text = String(oldY)
            numberOfYear.text = String(oldYearsNumber)
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
        } else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            letoLabel.text = String(oldY)
            numberOfYear.text = String(oldYearsNumber)
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
        }
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(liveOldTime), userInfo: Date(), repeats: true)
    }
    
    @objc func liveOldTime() {
        //sepLabel.isHidden = !sepLabel.isHidden
        oldYearAndTime()
        nameOfHour()
    }
}
