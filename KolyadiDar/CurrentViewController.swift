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
    
    func oldMonth(yearsNumber: Int, month: Int, day: Int, hour: Int) {
        if yearsNumber >= 1 && yearsNumber <= 3 {
            if (month >= 12 && day >= 12 && hour >= 18)  {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 11 && day >= 2 && hour >= 18)  {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 22 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 12 && hour >= 18)  {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && day >= 3 && hour >= 18)  {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 23 && hour >= 18)  {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 13 && hour >= 18)  {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && day >= 3 && hour >= 18)  {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 22 && hour >= 18)  {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber == 4 {
            if (month >= 12 && day >= 12 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 11 && day >= 2 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 22 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 11 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && day >= 2 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 22 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 12 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && day >= 2 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 22 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber >= 5 && yearsNumber <= 7 {
            if (month >= 12 && day >= 11 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 11 && day >= 1 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 21 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 11 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && day >= 2 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 22 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 12 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && day >= 2 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 21 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber == 8 {
            if (month >= 12 && ((day >= 11 && hour >= 18) || (day >= 12 && hour >= 00))) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 11 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 10) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 9 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && ((day >= 10 && hour >= 18) || (day >= 11 && hour >= 00))) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 6 ) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 5 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && ((day >= 11 && hour >= 18) || (day >= 12 && hour >= 00))) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && ((day >= 1 && hour >= 18) || (day >= 2 && hour >= 00))) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 2) {
                monthLabel.text = "Гэйлѣтъ"
            } else if (month >= 1 && ((day >= 21 && hour >= 18) || (day >= 22 && hour >= 00))) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
            
        else if yearsNumber >= 9 && yearsNumber <= 11 {
            if (month >= 12 && day >= 10 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 10 && day >= 31 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 20 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 10 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && day >= 1 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 21 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 11 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && day >= 1 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 20 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber == 12 {
            if (month >= 12 && day >= 10 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 10 && day >= 31 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 20 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 9 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 6 && day >= 30 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 20 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 10 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 2 && day >= 29 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 20 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber >= 13 && yearsNumber <= 15 {
            if (month >= 12 && day >= 9 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 10 && day >= 30 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 19 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 9 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 6 && day >= 30 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 20 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 10 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 2 && day >= 28 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 19 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
        else if yearsNumber == 0 || yearsNumber == 16 {
            if (month >= 12 && day >= 10 && hour >= 18) {
                monthLabel.text = "Бейлѣтъ"
            } else if (month >= 10 && day >= 30 && hour >= 18) {
                monthLabel.text = "Айлѣтъ"
            } else if (month >= 9 && day >= 19 && hour >= 18) {
                monthLabel.text = "Рамхатъ"
            } else if (month >= 8 && day >= 12 && hour >= 18) {
                monthLabel.text = "Тайлѣтъ"
            } else if (month >= 7 && day >= 2 && hour >= 18) {
                monthLabel.text = "Хейлѣтъ"
            } else if (month >= 5 && day >= 22 && hour >= 18) {
                monthLabel.text = "Вэйлѣтъ"
            } else if (month >= 4 && day >= 11 && hour >= 18) {
                monthLabel.text = "Элѣтъ"
            } else if (month >= 3 && day >= 1 && hour >= 18) {
                monthLabel.text = "Дайлѣтъ"
            } else if (month >= 1 && day >= 20 && hour >= 18) {
                monthLabel.text = "Гэйлѣтъ"
            }
        }
    }
    
    func oldYearAndTime() {
        let hour = currentDate.getCurrentHours()
        //let hour = 17
        let minute = currentDate.getCurrentMinutes()
        let second = currentDate.getCurrentSeconds()
        let year = currentDate.getCurrentYear()
        let month = currentDate.getCurrentMonth()
        //let month = 3
        let day = currentDate.getCurrentDay()
        //let day = 1
        
        if month >= 1 && month <= 9 {
            var oldY = year + 5508
            var yearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            if month == 9 {
                if yearsNumber >= 0 && yearsNumber <= 3 {
                    if (day == 22 && hour >= 18) ||  day > 22 {
                        oldY += 1
                        yearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    } else if (day == 22 && hour <= 18) || day < 22 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    }
                } else if yearsNumber >= 4 && yearsNumber <= 7 {
                    if (day == 21 && hour >= 18) ||  day > 21 {
                        oldY += 1
                        yearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    } else if (day == 21 && hour <= 18) || day < 21 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    }
                } else if yearsNumber >= 8 && yearsNumber <= 11 {
                    if (day == 20 && hour >= 18) ||  day > 20 {
                        oldY += 1
                        yearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    } else if (day == 20 && hour <= 18) || day < 20 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    }
                } else if yearsNumber >= 12 && yearsNumber == 15 {
                    if (day == 19 && hour >= 18) ||  day > 19 {
                        oldY += 1
                        yearsNumber += 1
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    } else if (day == 19 && hour <= 18) || day < 19 {
                        letoLabel.text = String(oldY)
                        numberOfYear.text = String(yearsNumber)
                        oldTime(hour: hour, minute: minute, second: second)
                        oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
                    }
                }
            }
            letoLabel.text = String(oldY)
            numberOfYear.text = String(yearsNumber)
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
        } else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let yearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            letoLabel.text = String(oldY)
            numberOfYear.text = String(yearsNumber)
            oldTime(hour: hour, minute: minute, second: second)
            oldMonth(yearsNumber: yearsNumber, month: month, day: day, hour: hour)
        }
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(liveOldTime), userInfo: Date(), repeats: true)
    }
    
    @objc func liveOldTime() {
        //sepLabel.isHidden = !sepLabel.isHidden
        oldYearAndTime()
    }
}
