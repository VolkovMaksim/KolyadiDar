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
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    var currentDate = CurrentDate()
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 22 && hour <= 18) || day < 22 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 22
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber == 4 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && hour <= 18) || day < 21 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 22
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber >= 5 && oldYearsNumber <= 7 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && hour <= 18) || day < 21 {
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
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber >= 9 && oldYearsNumber <= 11 {
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
            let startDay = 20
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber == 12 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && hour <= 18) || day < 19 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 20
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber >= 13 && oldYearsNumber <= 15 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && hour <= 18) || day < 19 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 19
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let addOldDay = Int(endMonth / 2)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41)) + addOldDay
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        }
        else if oldYearsNumber == 0 || oldYearsNumber == 16 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && hour <= 18) || day < 19 {
                        startYear = year - 1
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
            }
            let startMonth = 9
            let startDay = 19
            let startHour = 18
            let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
            let differenceMinute = differenceSecond / 60
            let differenceHour = differenceMinute / 90
            let differenceDay = differenceHour / 16
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            let endMonth = Int(differenceDay / 41)
            let endDay = Int(Double(differenceDay).truncatingRemainder(dividingBy: 41))
            
            //let oldHour = Int(Double(differenceHour).truncatingRemainder(dividingBy: 16))
            let oldMonth = endMonth + 1
            let oldDay = endDay + 1
            
            dayLabel.text = String(oldDay)
            dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            
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
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(liveOldTime), userInfo: Date(), repeats: true)
    }
    
    @objc func liveOldTime() {
        //sepLabel.isHidden = !sepLabel.isHidden
        oldYearAndTime()
        nameOfHour()
    }
}
