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
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var fullTitleOfMonth: UILabel!
    @IBOutlet weak var letoLabel: UILabel!
    @IBOutlet weak var numberOfYear: UILabel!
    @IBOutlet weak var numberOfYearInRoundOfLife: UILabel!
    @IBOutlet weak var titleOfYear: UILabel!
    
    @IBOutlet weak var titleOfHour: UILabel!
    @IBOutlet weak var fullTitleOfHour: UILabel!
    @IBOutlet weak var titleOfConstellation: UILabel!
    
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var postdayLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var runesOfHour: UIImageView!
    @IBOutlet weak var scratchesOfHour: UIImageView!
    @IBOutlet weak var rpDay: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var currentDate = CurrentDate()
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.showsVerticalScrollIndicator = false
        holidayLabel.isHidden = true
        postdayLabel.isHidden = true
        //holidayLabel.font = UIFont(name: "-Normal", size: 30)
        //postdayLabel.font = UIFont(name: "-Normal", size: 30)
        //rpDay.image = UIImage(named: "Parrents")
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
                runesOfHour.image = UIImage(named: "runes_\(hourLabel.text!)")
                scratchesOfHour.image = UIImage(named: "scr_\(hourLabel.text!)")
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
                runesOfHour.image = UIImage(named: "runes_\(hourLabel.text!)")
                scratchesOfHour.image = UIImage(named: "scr_\(hourLabel.text!)")
            }
            
            if oldM < 10 {
                minuteLabel.text = "00\(oldM)"
            } else if oldM >= 10 && oldM < 100 {
                minuteLabel.text = "0\(oldM)"
            } else if oldM >= 100 {
                minuteLabel.text = "\(oldM)"
            }
            
            if oldS < 10 {
                secondLabel.text = "000\(oldS)"
            } else if oldS >= 10 && oldS < 100 {
                secondLabel.text = "00\(oldS)"
            } else if oldS >= 100 && oldS < 1000 {
                secondLabel.text = "0\(oldS)"
            } else if oldS >= 1000 {
                secondLabel.text = "\(oldS)"
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
                runesOfHour.image = UIImage(named: "runes_\(hourLabel.text!)")
                scratchesOfHour.image = UIImage(named: "scr_\(hourLabel.text!)")
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
                runesOfHour.image = UIImage(named: "runes_\(hourLabel.text!)")
                scratchesOfHour.image = UIImage(named: "scr_\(hourLabel.text!)")
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().holidays[differenceDay + 1] != nil {
                holidayLabel.isHidden = false
                holidayLabel.font = UIFont(name: "-Normal", size: 30)
                holidayLabel.text = HolidayAndDay().holidays[differenceDay + 1]
            }
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            if differenceDay >= 0 && differenceDay <= 20 {
                titleOfConstellation.text = "Чертог Вепря"
            } else if differenceDay >= 21 && differenceDay >= 43 {
                titleOfConstellation.text = "Чертог Щуки"
            } else if differenceDay >= 21 && differenceDay >= 43 {
                titleOfConstellation.text = "Чертог Щуки"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
                fullTitleOfMonth.text = "Сороковник Божественного Начала"
            } else if differenceDay >= 41 && differenceDay <= 80 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
                fullTitleOfMonth.text = "Сороковник Новых Даров"
            } else if differenceDay >= 81 && differenceDay <= 121 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
                fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            } else if differenceDay >= 122 && differenceDay <= 161 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
                fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            } else if differenceDay >= 162 && differenceDay <= 202 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
                fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            } else if differenceDay >= 203 && differenceDay <= 242 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
                fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            } else if differenceDay >= 243 && differenceDay <= 283 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
                fullTitleOfMonth.text = "Сороковник Ветров"
            } else if differenceDay >= 284 && differenceDay <= 323 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
                fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            } else if differenceDay >= 324 && differenceDay <= 364 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
                fullTitleOfMonth.text = "Сороковник Завершения"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
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
            
            if HolidayAndDay().daysOfParrents_16.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Parrents")
            }
            if HolidayAndDay().daysOfMemory_16.firstIndex(of: differenceDay + 1) != nil {
                //rpDay.isHidden = false
                rpDay.image = UIImage(named: "Predki")
            }
            
            if HolidayAndDay().datesOfPosts1.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Святый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts2_16.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Даждьбожий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts3_16.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Чистый ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts4_16.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Великий ПОСТЪ"
            }
            
            if HolidayAndDay().datesOfPosts5_16.firstIndex(of: differenceDay + 1) != nil {
                postdayLabel.isHidden = false
                postdayLabel.font = UIFont(name: "-Normal", size: 30)
                postdayLabel.text = "Светлый ПОСТЪ"
            }
            
            if differenceDay >= 0 && differenceDay <= 40 {
                monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
            } else if differenceDay >= 41 && differenceDay <= 81 {
                monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
            } else if differenceDay >= 82 && differenceDay <= 122 {
                monthLabel.text = "Бейлѣтъ, день \(differenceDay - 81)"
            } else if differenceDay >= 123 && differenceDay <= 163 {
                monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 122)"
            } else if differenceDay >= 164 && differenceDay <= 204 {
                monthLabel.text = "Дайлѣтъ, день \(differenceDay - 163)"
            } else if differenceDay >= 205 && differenceDay <= 245 {
                monthLabel.text = "Элѣтъ, день \(differenceDay - 204)"
            } else if differenceDay >= 246 && differenceDay <= 286 {
                monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 245)"
            } else if differenceDay >= 287 && differenceDay <= 327 {
                monthLabel.text = "Хейлѣтъ, день \(differenceDay - 286)"
            } else if differenceDay >= 328 && differenceDay <= 368 {
                monthLabel.text = "Тайлѣтъ, день \(differenceDay - 327)"
            }
            
            let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
            if oldDayOfWeek != 0 {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            } else {
                dayOfWeekLabel.text = (OldDaysOfWeek.init().dayOfWeek(day: 8))
                dayOfWeekLabel.textColor = .red
            }
        }
    }
    
    func nameOfHour() {
        if hourLabel.text == "16" {
            titleOfHour.text = "Вѣчеръ, ПОѸДАНИ"
            fullTitleOfHour.text = "Завершенный день"
        } else if hourLabel.text == "01" {
            titleOfHour.text = "Вѣчеръ, ПАOБѢДЪ"
            fullTitleOfHour.text = "Начало нового дня"
        } else if hourLabel.text == "02" {
            titleOfHour.text = "Вѣчеръ, ВѢЧИРЪ"
            fullTitleOfHour.text = "Появление звездной росы на Небесах"
        } else if hourLabel.text == "03" {
            titleOfHour.text = "Вѣчеръ, НИЧЬ"
            fullTitleOfHour.text = "Нечетное время трех Лун"
        } else if hourLabel.text == "04" {
            titleOfHour.text = "Ночь, ПОЛНИЧЬ"
            fullTitleOfHour.text = "Полный путь Лун"
        } else if hourLabel.text == "05" {
            titleOfHour.text = "Ночь, ЗАѸТРА"
            fullTitleOfHour.text = "Звездное утешение росы"
        } else if hourLabel.text == "06" {
            titleOfHour.text = "Ночь, ЗАѸРА"
            fullTitleOfHour.text = "Звездное сияние, заря"
        } else if hourLabel.text == "07" {
            titleOfHour.text = "Ночь, ЗАѸРНИЦЕ"
            fullTitleOfHour.text = "Окончание звездного сияния"
        } else if hourLabel.text == "08" {
            titleOfHour.text = "Утро, НАСТѦ"
            fullTitleOfHour.text = "Утренная роса"
        } else if hourLabel.text == "09" {
            titleOfHour.text = "Утро, СВАОРЪ"
            fullTitleOfHour.text = "Восход Солнца"
        } else if hourLabel.text == "10" {
            titleOfHour.text = "Утро, УТРОСЬ"
            fullTitleOfHour.text = "Успокоение росы"
        } else if hourLabel.text == "11" {
            titleOfHour.text = "Утро, ПОѸТРОСЬ"
            fullTitleOfHour.text = "Путь собирания успокоенной росы"
        } else if hourLabel.text == "12" {
            titleOfHour.text = "Дѣнь, ОБЕСТНА"
            fullTitleOfHour.text = "Обедня, совместное собрание"
        } else if hourLabel.text == "13" {
            titleOfHour.text = "Дѣнь, ОБЕДЪ (ОБЕСТЬ)"
            fullTitleOfHour.text = "Трапеза"
        } else if hourLabel.text == "14" {
            titleOfHour.text = "Дѣнь, ПОДАНИ"
            fullTitleOfHour.text = "Отдых после трапезы"
        } else if hourLabel.text == "15" {
            titleOfHour.text = "Дѣнь, УТДАЙНИ"
            fullTitleOfHour.text = "Время окончания деяний"
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
            var oldYearsNumberInRoundOfLife = oldY - 7520
            if month == 9 {
                if oldYearsNumber >= 0 && oldYearsNumber <= 3 {
                    if (day == 22 && hour >= 18) ||  day > 22 {
                        oldY += 1
                        oldYearsNumber += 1
                        oldYearsNumberInRoundOfLife += 1
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 22 && hour <= 18) || day < 22 {
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 4 && oldYearsNumber <= 7 {
                    if (day == 21 && hour >= 18) ||  day > 21 {
                        oldY += 1
                        oldYearsNumber += 1
                        oldYearsNumberInRoundOfLife += 1
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 21 && hour <= 18) || day < 21 {
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 8 && oldYearsNumber <= 11 {
                    if (day == 20 && hour >= 18) ||  day > 20 {
                        oldY += 1
                        oldYearsNumber += 1
                        oldYearsNumberInRoundOfLife += 1
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 20 && hour <= 18) || day < 20 {
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                } else if oldYearsNumber >= 12 && oldYearsNumber == 15 {
                    if (day == 19 && hour >= 18) ||  day > 19 {
                        oldY += 1
                        oldYearsNumber += 1
                        oldYearsNumberInRoundOfLife += 1
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    } else if (day == 19 && hour <= 18) || day < 19 {
                        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
                        numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
                        numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
                        titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
                    }
                }
            }
            letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
            numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
            numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
            titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, hour: hour)
        } else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = oldY - 7520
            letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
            numberOfYear.text = "Лѣто в Круге лѣт: \(oldYearsNumber)"
            numberOfYearInRoundOfLife.text = "Лѣто в Круге жизни: \(oldYearsNumberInRoundOfLife)"
            titleOfYear.text = "\(OldYear().arrayOfTitleOfYears[oldYearsNumberInRoundOfLife - 1])"
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
