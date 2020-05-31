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
    @IBOutlet weak var titleOfYearLabel: UILabel!
    @IBOutlet weak var epohaLabel: UILabel!
    @IBOutlet weak var epohaGodLabel: UILabel!
    
    @IBOutlet weak var titleOfHour: UILabel!
    @IBOutlet weak var fullTitleOfHour: UILabel!
    @IBOutlet weak var titleOfConstellation: UILabel!
    @IBOutlet weak var nameOfGod: UILabel!
    @IBOutlet weak var treeLabel: UILabel!
    
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var postdayLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var dayOfWeekImage: UIImageView!
    @IBOutlet weak var planetOfDayOfWeekLabel: UILabel!
    @IBOutlet weak var planetOfGodLabel: UILabel!
    @IBOutlet weak var runesOfHour: UIImageView!
    @IBOutlet weak var scratchesOfHour: UIImageView!
    @IBOutlet weak var rpDay: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var currentDate = CurrentDate()
    var oldYear = OldYear()
    var titleOfYear = ""
    var timer = Timer()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.showsVerticalScrollIndicator = false
        holidayLabel.isHidden = true
        postdayLabel.isHidden = true
        rpDay.isHidden = true
        //holidayLabel.font = UIFont(name: "-Normal", size: 30)
        //postdayLabel.font = UIFont(name: "-Normal", size: 30)
        //rpDay.image = UIImage(named: "Parrents")
    }
    
    
    // MARK: - Funcs of Time
    
    func runesOfHours(name: String) {
        runesOfHour.image = UIImage(named: "runes_\(name)")
        scratchesOfHour.image = UIImage(named: "scr_\(name)")
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
    
    func oldTime(hour: Int, minute: Int, second: Int) {
        // годины, части, доли
        if hour < 18 {
            let time = (hour + 6) * 3600 + minute * 60 + second
            let oldH = Int(time / 5400)
            let oldM = Int(Double(time - (oldH * 5400))/37.5)
            let oldS = Int((Double(time) - Double(oldH) * 5400 - Double(oldM) * 37.5) / 0.05787 * 2)
            
            if oldH < 10 {
                hourLabel.text = "0\(oldH)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(hourLabel.text, forKey: "hours")
                runesOfHours(name: hourLabel.text!)
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(hourLabel.text, forKey: "hours")
                runesOfHours(name: hourLabel.text!)
            }
            
            if oldM < 10 {
                minuteLabel.text = "00\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            } else if oldM >= 10 && oldM < 100 {
                minuteLabel.text = "0\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            } else if oldM >= 100 {
                minuteLabel.text = "\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            }
            
            if oldS < 10 {
                secondLabel.text = "000\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 10 && oldS < 100 {
                secondLabel.text = "00\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 100 && oldS < 1000 {
                secondLabel.text = "0\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 1000 {
                secondLabel.text = "\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            }
        }
        else if hour >= 18 {
            let time = (hour - 18) * 3600 + minute * 60 + second
            var oldH = Int(time / 5400)
            let oldM = Int(Double(time - (oldH * 5400))/37.5)
            let oldS = Int((Double(time) - Double(oldH) * 5400 - Double(oldM) * 37.5) / 0.05787 * 2)
            if time < 5400 {
                oldH = 16
            }
            
            if oldH < 10 {
                hourLabel.text = "0\(oldH)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(hourLabel.text, forKey: "hours")
                runesOfHours(name: hourLabel.text!)
            } else if oldH >= 10 {
                hourLabel.text = "\(oldH)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(hourLabel.text, forKey: "hours")
                runesOfHours(name: hourLabel.text!)
            }
            
            if oldM < 10 {
                minuteLabel.text = "00\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            } else if oldM >= 10 && oldM < 100 {
                minuteLabel.text = "0\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            } else if oldM >= 100 {
                minuteLabel.text = "\(oldM)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(minuteLabel.text, forKey: "minutes")
            }
            
            if oldS < 10 {
                secondLabel.text = "000\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 10 && oldS < 100 {
                secondLabel.text = "00\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 100 && oldS < 1000 {
                secondLabel.text = "0\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            } else if oldS >= 1000 {
                secondLabel.text = "\(oldS)"
                UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(secondLabel.text, forKey: "seconds")
            }
        }
    }
    
    
    // MARK: - Funcs of Month and Holidays
    
    func parrentsDays(differenceDay: Int) {
        if HolidayAndDay().daysOfParrents.firstIndex(of: differenceDay + 1) != nil {
            rpDay.isHidden = false
            rpDay.image = UIImage(named: "Parrents")
        } else {
            rpDay.isHidden = true
        }
        if HolidayAndDay().daysOfMemory.firstIndex(of: differenceDay + 1) != nil {
            rpDay.isHidden = false
            rpDay.image = UIImage(named: "Predki")
        } else {
            rpDay.isHidden = true
        }
        UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(rpDay.image?.pngData(), forKey: "rpDay")
    }
    
    func parrentsDays_16(differenceDay: Int) {
        if HolidayAndDay().daysOfParrents_16.firstIndex(of: differenceDay + 1) != nil {
            rpDay.isHidden = false
            rpDay.image = UIImage(named: "Parrents")
        } else {
            rpDay.isHidden = true
        }
        if HolidayAndDay().daysOfMemory_16.firstIndex(of: differenceDay + 1) != nil {
            rpDay.isHidden = false
            rpDay.image = UIImage(named: "Predki")
        } else {
            rpDay.isHidden = true
        }
        UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(rpDay.image?.pngData(), forKey: "rpDay")
    }
    
    func allPosts(differenceDay: Int) {
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
    }
    
    func allPosts_16(differenceDay: Int) {
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
    }
    
    func monthAndDay(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 40 {
            monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
            fullTitleOfMonth.text = "Сороковник Божественного Начала"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 41 && differenceDay <= 80 {
            monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
            fullTitleOfMonth.text = "Сороковник Новых Даров"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 81 && differenceDay <= 121 {
            monthLabel.text = "Бейлѣтъ, день \(differenceDay - 80)"
            fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 122 && differenceDay <= 161 {
            monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 121)"
            fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 162 && differenceDay <= 202 {
            monthLabel.text = "Дайлѣтъ, день \(differenceDay - 161)"
            fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 203 && differenceDay <= 242 {
            monthLabel.text = "Элѣтъ, день \(differenceDay - 202)"
            fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 243 && differenceDay <= 283 {
            monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 242)"
            fullTitleOfMonth.text = "Сороковник Ветров"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 284 && differenceDay <= 323 {
            monthLabel.text = "Хейлѣтъ, день \(differenceDay - 283)"
            fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 324 && differenceDay <= 364 {
            monthLabel.text = "Тайлѣтъ, день \(differenceDay - 323)"
            fullTitleOfMonth.text = "Сороковник Завершения"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        }
    }
    
    func monthAndDay_16(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 40 {
            monthLabel.text = "Рамхатъ, день \(differenceDay + 1)"
            fullTitleOfMonth.text = "Сороковник Божественного Начала"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 41 && differenceDay <= 81 {
            monthLabel.text = "Айлѣтъ, день \(differenceDay - 40)"
            fullTitleOfMonth.text = "Сороковник Новых Даров"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 82 && differenceDay <= 122 {
            monthLabel.text = "Бейлѣтъ, день \(differenceDay - 81)"
            fullTitleOfMonth.text = "Сороковник Белого Сияния и Покоя Мира"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 123 && differenceDay <= 163 {
            monthLabel.text = "Гэйлѣтъ, день \(differenceDay - 122)"
            fullTitleOfMonth.text = "Сороковник Вьюг и Стужи"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 164 && differenceDay <= 204 {
            monthLabel.text = "Дайлѣтъ, день \(differenceDay - 163)"
            fullTitleOfMonth.text = "Сороковник Пробуждения Природы"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 205 && differenceDay <= 245 {
            monthLabel.text = "Элѣтъ, день \(differenceDay - 204)"
            fullTitleOfMonth.text = "Сороковник Посева и Наречения"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 246 && differenceDay <= 286 {
            monthLabel.text = "Вэйлѣтъ, день \(differenceDay - 245)"
            fullTitleOfMonth.text = "Сороковник Ветров"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 287 && differenceDay <= 327 {
            monthLabel.text = "Хейлѣтъ, день \(differenceDay - 286)"
            fullTitleOfMonth.text = "Сороковник Получения Даров Природы"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        } else if differenceDay >= 328 && differenceDay <= 368 {
            monthLabel.text = "Тайлѣтъ, день \(differenceDay - 327)"
            fullTitleOfMonth.text = "Сороковник Завершения"
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(monthLabel.text, forKey: "month")
        }
    }
    
    func oldDaysOfWeek(differenceDay: Int) {
        let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
        if oldDayOfWeek != 0 {
            dayOfWeekLabel.text = OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1)
            planetOfDayOfWeekLabel.text = OldDaysOfWeek.init().planetsOfDaysOfWeek(day: oldDayOfWeek - 1)
            planetOfGodLabel.text = OldDaysOfWeek.init().planetsOfGods(day: oldDayOfWeek - 1)
            planetOfGodLabel.font = UIFont(name: "-Normal", size: 20)
            dayOfWeekImage.image = UIImage(named: OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(OldDaysOfWeek.init().shortDayOfWeek(day: oldDayOfWeek - 1), forKey: "dayOfWeek")
            dayOfWeekLabel.textColor = .black
            planetOfDayOfWeekLabel.textColor = .black
            planetOfGodLabel.isHidden = false
        } else {
            dayOfWeekLabel.text = OldDaysOfWeek.init().dayOfWeek(day: 8)
            planetOfDayOfWeekLabel.text = OldDaysOfWeek.init().planetsOfDaysOfWeek(day: 8)
            planetOfGodLabel.text = OldDaysOfWeek.init().planetsOfGods(day: 8)
            UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(OldDaysOfWeek.init().shortDayOfWeek(day: 8), forKey: "dayOfWeek")
            dayOfWeekLabel.textColor = .red
            planetOfDayOfWeekLabel.textColor = .red
            planetOfGodLabel.isHidden = true
            dayOfWeekImage.image = UIImage(named: OldDaysOfWeek.init().dayOfWeek(day: 8))
        }
        
        if dayOfWeekLabel.text!.contains("Седмица") && postdayLabel.isHidden == true {
            postdayLabel.isHidden = false
            postdayLabel.font = UIFont(name: "-Normal", size: 30)
            postdayLabel.text = "Однодневный ПОСТЪ"
        }
    }
    
    func daysOfConstellations(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 20 {
            titleOfConstellation.text = "Чертог Вепря"
            nameOfGod.text = "Бог-Покровитель Рамхатъ"
            treeLabel.text = "Груша"
        } else if differenceDay >= 21 && differenceDay <= 43 {
            titleOfConstellation.text = "Чертог Щуки"
            nameOfGod.text = "Богиня-Покровительница Рожана"
            treeLabel.text = "Слива"
        } else if differenceDay >= 44 && differenceDay <= 64 {
            titleOfConstellation.text = "Чертог Лебедя"
            nameOfGod.text = "Богиня-Покровительница Макошь"
            treeLabel.text = "Сосна"
        } else if differenceDay >= 65 && differenceDay <= 86 {
            titleOfConstellation.text = "Чертог Змея"
            nameOfGod.text = "Бог-Покровитель Съмарглъ"
            treeLabel.text = "Липа"
        } else if differenceDay >= 87 && differenceDay <= 108 {
            titleOfConstellation.text = "Чертог Ворона"
            nameOfGod.text = "Бог-Покровитель Колѧда"
            treeLabel.text = "Лиственница"
        } else if differenceDay >= 109 && differenceDay <= 132 {
            titleOfConstellation.text = "Чертог Медведя"
            nameOfGod.text = "Бог-Покровитель Сварогъ"
            treeLabel.text = "Малина, Бук"
        } else if differenceDay >= 133 && differenceDay <= 157 {
            titleOfConstellation.text = "Чертог Бусла"
            nameOfGod.text = "Бог-Покровитель Родъ"
            treeLabel.text = "Ива"
        } else if differenceDay >= 158 && differenceDay <= 182 {
            titleOfConstellation.text = "Чертог Волка"
            nameOfGod.text = "Бог-Покровитель Вьлесе"
            treeLabel.text = "Тополь"
        } else if differenceDay >= 183 && differenceDay <= 205 {
            titleOfConstellation.text = "Чертог Лисы"
            nameOfGod.text = "Богиня-Покровительница Мара"
            treeLabel.text = "Граб, Смородина"
        } else if differenceDay >= 206 && differenceDay <= 227 {
            titleOfConstellation.text = "Чертог Тура"
            nameOfGod.text = "Бог-Покровитель Крышьнь"
            treeLabel.text = "Осина"
        } else if differenceDay >= 228 && differenceDay <= 250 {
            titleOfConstellation.text = "Чертог Лося"
            nameOfGod.text = "Богиня-Покровительница Лада"
            treeLabel.text = "Береза"
        } else if differenceDay >= 251 && differenceDay <= 272 {
            titleOfConstellation.text = "Чертог Финиста"
            nameOfGod.text = "Бог-Покровитель Вышьнь"
            treeLabel.text = "Вишня"
        } else if differenceDay >= 273 && differenceDay <= 295 {
            titleOfConstellation.text = "Чертог Коня"
            nameOfGod.text = "Бог-Покровитель Кѫпала"
            treeLabel.text = "Папоротник, Вяз"
        } else if differenceDay >= 296 && differenceDay <= 317 {
            titleOfConstellation.text = "Чертог Орла"
            nameOfGod.text = "Бог-Покровитель Перуне"
            treeLabel.text = "Дуб"
        } else if differenceDay >= 318 && differenceDay <= 340 {
            titleOfConstellation.text = "Чертог Раса"
            nameOfGod.text = "Бог-Покровитель Тархъ"
            treeLabel.text = "Ясень, Игг"
        } else if differenceDay >= 341 && differenceDay <= 364 {
            titleOfConstellation.text = "Чертог Девы"
            nameOfGod.text = "Бог-Покровитель Джива"
            treeLabel.text = "Яблоня"
        }
    }
    
    func daysOfConstellations_16(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 20 {
            titleOfConstellation.text = "Чертог Вепря"
            nameOfGod.text = "Бог-Покровитель Рамхатъ"
            treeLabel.text = "Груша"
        } else if differenceDay >= 21 && differenceDay <= 43 {
            titleOfConstellation.text = "Чертог Щуки"
            nameOfGod.text = "Богиня-Покровительница Рожана"
            treeLabel.text = "Слива"
        } else if differenceDay >= 44 && differenceDay <= 64 {
            titleOfConstellation.text = "Чертог Лебедя"
            nameOfGod.text = "Богиня-Покровительница Макошь"
            treeLabel.text = "Сосна"
        } else if differenceDay >= 65 && differenceDay <= 87 {
            titleOfConstellation.text = "Чертог Змея"
            nameOfGod.text = "Бог-Покровитель Съмарглъ"
            treeLabel.text = "Липа"
        } else if differenceDay >= 88 && differenceDay <= 109 {
            titleOfConstellation.text = "Чертог Ворона"
            nameOfGod.text = "Бог-Покровитель Колѧда"
            treeLabel.text = "Лиственница"
        } else if differenceDay >= 110 && differenceDay <= 133 {
            titleOfConstellation.text = "Чертог Медведя"
            nameOfGod.text = "Бог-Покровитель Сварогъ"
            treeLabel.text = "Малина, Бук"
        } else if differenceDay >= 134 && differenceDay <= 159 {
            titleOfConstellation.text = "Чертог Бусла"
            nameOfGod.text = "Бог-Покровитель Родъ"
            treeLabel.text = "Ива"
        } else if differenceDay >= 160 && differenceDay <= 184 {
            titleOfConstellation.text = "Чертог Волка"
            nameOfGod.text = "Бог-Покровитель Вьлесе"
            treeLabel.text = "Тополь"
        } else if differenceDay >= 185 && differenceDay <= 207 {
            titleOfConstellation.text = "Чертог Лисы"
            nameOfGod.text = "Богиня-Покровительница Мара"
            treeLabel.text = "Граб, Смородина"
        } else if differenceDay >= 208 && differenceDay <= 229 {
            titleOfConstellation.text = "Чертог Тура"
            nameOfGod.text = "Бог-Покровитель Крышьнь"
            treeLabel.text = "Осина"
        } else if differenceDay >= 230 && differenceDay <= 253 {
            titleOfConstellation.text = "Чертог Лося"
            nameOfGod.text = "Богиня-Покровительница Лада"
            treeLabel.text = "Береза"
        } else if differenceDay >= 254 && differenceDay <= 275 {
            titleOfConstellation.text = "Чертог Финиста"
            nameOfGod.text = "Бог-Покровитель Вышьнь"
            treeLabel.text = "Вишня"
        } else if differenceDay >= 276 && differenceDay <= 298 {
            titleOfConstellation.text = "Чертог Коня"
            nameOfGod.text = "Бог-Покровитель Кѫпала"
            treeLabel.text = "Папоротник, Вяз"
        } else if differenceDay >= 299 && differenceDay <= 320 {
            titleOfConstellation.text = "Чертог Орла"
            nameOfGod.text = "Бог-Покровитель Перуне"
            treeLabel.text = "Дуб"
        } else if differenceDay >= 321 && differenceDay <= 344 {
            titleOfConstellation.text = "Чертог Раса"
            nameOfGod.text = "Бог-Покровитель Тархъ"
            treeLabel.text = "Ясень, Игг"
        } else if differenceDay >= 345 && differenceDay <= 368 {
            titleOfConstellation.text = "Чертог Девы"
            nameOfGod.text = "Бог-Покровитель Джива"
            treeLabel.text = "Яблоня"
        }
    }
    
    func viewOfHolidays(differenceDay: Int) {
        if HolidayAndDay().holidays[differenceDay + 1] != nil {
            holidayLabel.isHidden = false
            holidayLabel.font = UIFont(name: "-Normal", size: 30)
            holidayLabel.text = HolidayAndDay().holidays[differenceDay + 1]
        }
    }
    
    func viewOfHolidays_16(differenceDay: Int) {
        if HolidayAndDay().holidays_16[differenceDay + 1] != nil {
            holidayLabel.isHidden = false
            holidayLabel.font = UIFont(name: "-Normal", size: 30)
            holidayLabel.text = HolidayAndDay().holidays[differenceDay + 1]
        }
    }
    
    func differenceTime(startYear: Int, startMonth: Int, startDay: Int, startHour: Int) -> Int {
        let differenceSecond = currentDate.getDifferenceTime(year: startYear, month: startMonth, day: startDay, hour: startHour)
        let differenceDay = differenceSecond / (16 * 90 * 60)
        return differenceDay
    }
    
    func allForMonthsAdnDays(differenceDay: Int) {
        parrentsDays(differenceDay: differenceDay)
        viewOfHolidays(differenceDay: differenceDay)
        allPosts(differenceDay: differenceDay)
        monthAndDay(differenceDay: differenceDay)
        oldDaysOfWeek(differenceDay: differenceDay)
        daysOfConstellations(differenceDay: differenceDay)
    }
    
    func oldMonth(oldYearsNumber: Int, year: Int, month: Int, day: Int, timeAfterSixPM: Bool) {
        if oldYearsNumber >= 1 && oldYearsNumber <= 3 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 22 && timeAfterSixPM == false) || day < 22 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber == 4 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && timeAfterSixPM == false) || day < 21 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber >= 5 && oldYearsNumber <= 7 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && timeAfterSixPM == false) || day < 21 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber == 8 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 20 && timeAfterSixPM == false) || day < 20 {
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
            
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber >= 9 && oldYearsNumber <= 11 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 20 && timeAfterSixPM == false) || day < 20 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber == 12 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && timeAfterSixPM == false) || day < 19 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber >= 13 && oldYearsNumber <= 15 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && timeAfterSixPM == false) || day < 19 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            allForMonthsAdnDays(differenceDay: differenceDay)
        }
        else if oldYearsNumber == 0 || oldYearsNumber == 16 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 19 && timeAfterSixPM == false) || day < 19 {
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
            let differenceDay = differenceTime(startYear: startYear, startMonth: startMonth, startDay: startDay, startHour: startHour)
            
            parrentsDays_16(differenceDay: differenceDay)
            viewOfHolidays_16(differenceDay: differenceDay)
            allPosts_16(differenceDay: differenceDay)
            monthAndDay_16(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay)
            daysOfConstellations_16(differenceDay: differenceDay)
        }
    }
    
    // MARK: - Funcs of Years
    
    func addYear(oldY: Int, oldYearsNumber: Int, oldYearsNumberInRoundOfLife: Int) {
        var oldyearsNumber = 0
        if oldYearsNumber == 0 {
             oldyearsNumber += 16
        } else {
            oldyearsNumber = oldYearsNumber
        }
        
        var oldyearsNumberInRoundOfLife = 0
        if oldYearsNumberInRoundOfLife == 0 {
             oldyearsNumberInRoundOfLife += 144
        } else {
            oldyearsNumberInRoundOfLife = oldYearsNumberInRoundOfLife
        }
        letoLabel.text = "Лѣто \(oldY) от С.З.М.Х."
        titleOfYearLabel.text = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        numberOfYear.text = "\(oldyearsNumber) лѣто в Круге лѣт"
        numberOfYearInRoundOfLife.text = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(letoLabel.text, forKey: "year")
        titleOfYear = titleOfYearLabel.text!
        yearsOfEpoha(oldYear: oldY)
    }
    
    func addYearPlusOne(oldY: Int, oldYearsNumber: Int, oldYearsNumberInRoundOfLife: Int) {
        let oldy = oldY + 1
        let oldyearsNumber = oldYearsNumber + 1
        let oldyearsNumberInRoundOfLife = oldYearsNumberInRoundOfLife + 1
        letoLabel.text = "Лѣто \(oldy) от С.З.М.Х."
        titleOfYearLabel.text = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        numberOfYear.text = "\(oldyearsNumber) лѣто в Круге лѣт"
        numberOfYearInRoundOfLife.text = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.setValue(letoLabel.text, forKey: "year")
        titleOfYear = titleOfYearLabel.text!
        yearsOfEpoha(oldYear: oldy)
    }
    
    func yearsOfEpoha(oldYear: Int) {
        if oldYear >= 4280 && oldYear <= 5900 {
            epohaLabel.text = "Эпоха Тура"
            epohaGodLabel.text = "Бог-Покровитель Крышьнь"
        } else if oldYear >= 5901 && oldYear <= 7520 {
            epohaLabel.text = "Эпоха Лисы"
            epohaGodLabel.text = "Богиня-Покровительница Мара"
        } else if oldYear >= 7521 && oldYear <= 9140 {
            epohaLabel.text = "Эпоха Волка"
            epohaGodLabel.text = "Бог-Покровитель Вьлесе"
        } else if oldYear >= 9141 && oldYear <= 10760 {
            epohaLabel.text = "Эпоха Бусла"
            epohaGodLabel.text = "Бог-Покровитель Родъ"
        } else if oldYear >= 10761 && oldYear <= 12380 {
            epohaLabel.text = "Эпоха Медведя"
            epohaGodLabel.text = "Бог-Покровитель Сварогъ"
        } else if oldYear >= 12381 && oldYear <= 14000 {
            epohaLabel.text = "Эпоха Ворона"
            epohaGodLabel.text = "Бог-Покровитель Колѧда"
        } else if oldYear >= 14001 && oldYear <= 15620 {
            epohaLabel.text = "Эпоха Змея"
            epohaGodLabel.text = "Бог-Покровитель Съмарглъ"
        }
    }
    
    func oldYearAndTime() {
        let timeAfterSixPM = currentDate.timeAfterSixPM()
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
            let oldY = year + 5508
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = Int(Double(year + 4).truncatingRemainder(dividingBy: 144))
            if month == 9 {
                if oldYearsNumber >= 0 && oldYearsNumber <= 3 {
                    if (day == 22 && timeAfterSixPM == true) ||  day > 22 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 22 && timeAfterSixPM == false) || day < 22 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 4 && oldYearsNumber <= 7 {
                    if (day == 21 && timeAfterSixPM == true) ||  day > 21 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 21 && timeAfterSixPM == false) || day < 21 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 8 && oldYearsNumber <= 11 {
                    if (day == 20 && timeAfterSixPM == true) ||  day > 20 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 20 && timeAfterSixPM == false) || day < 20 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 12 && oldYearsNumber <= 15 {
                    if (day == 19 && timeAfterSixPM == true) ||  day > 19 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 19 && timeAfterSixPM == false) || day < 19 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
            }
            else {
                addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
            }
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, timeAfterSixPM: timeAfterSixPM)
        }
        else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = Int(Double(year + 5).truncatingRemainder(dividingBy: 144))
            addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(oldYearsNumber: oldYearsNumber, year: year, month: month, day: day, timeAfterSixPM: timeAfterSixPM)
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
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // если идентификатор сигвея соответствует "DetailPage"
        if segue.identifier == "YearsInfo" {
            let pageVC = segue.destination as! YearsPageViewController
            for year in oldYear.arrayOfAdvtitleOfYears {
                if year.contains(titleOfYear) {
                    pageVC.yearTitle = year
                    
                }
            }
        }
    }
}
