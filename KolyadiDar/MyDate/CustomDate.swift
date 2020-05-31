//
//  CustomDate.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 29.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import Foundation

class CustomDate {
    
    //var currentDate = CurrentDate()
    
    let currentVC = CurrentViewController()
    
    var arrayOfDate: [String] = ["", "", "", "", "", "", "", "", "", ""]
    
    // Поиск сороковника, дня, чертога и Бога-Покровителя
    
    
    // Поиск лета
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
        arrayOfDate[4] = "Лѣто \(oldY) от С.З.М.Х."
        arrayOfDate[5] = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        arrayOfDate[6] = "\(oldyearsNumber) лѣто в Круге лѣт"
        arrayOfDate[7] = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        yearsOfEpoha(oldYear: oldY)
    }
    
    func addYearPlusOne(oldY: Int, oldYearsNumber: Int, oldYearsNumberInRoundOfLife: Int) {
        let oldy = oldY + 1
        let oldyearsNumber = oldYearsNumber + 1
        let oldyearsNumberInRoundOfLife = oldYearsNumberInRoundOfLife + 1
        arrayOfDate[4] = "Лѣто \(oldy) от С.З.М.Х."
        arrayOfDate[5] = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        arrayOfDate[6] = "\(oldyearsNumber) лѣто в Круге лѣт"
        arrayOfDate[7] = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        yearsOfEpoha(oldYear: oldy)
    }
    
    func yearsOfEpoha(oldYear: Int) {
        if oldYear >= 4280 && oldYear <= 5900 {
            arrayOfDate[8] = "Эпоха Тура"
            arrayOfDate[9] = "Бог-Покровитель Крышьнь"
        } else if oldYear >= 5901 && oldYear < 7521 {
            arrayOfDate[8] = "Эпоха Лисы"
            arrayOfDate[9] = "Богиня-Покровительница Мара"
        } else if oldYear >= 7521 && oldYear <= 9140 {
            arrayOfDate[8] = "Эпоха Волка"
            arrayOfDate[9] = "Бог-Покровитель Вьлесе"
        } else if oldYear >= 9141 && oldYear <= 10760 {
            arrayOfDate[8] = "Эпоха Бусла"
            arrayOfDate[9] = "Бог-Покровитель Родъ"
        } else if oldYear >= 10761 && oldYear <= 12380 {
            arrayOfDate[8] = "Эпоха Медведя"
            arrayOfDate[9] = "Бог-Покровитель Сварогъ"
        } else if oldYear >= 12381 && oldYear <= 14000 {
            arrayOfDate[8] = "Эпоха Ворона"
            arrayOfDate[9] = "Бог-Покровитель Колѧда"
        } else if oldYear >= 14001 && oldYear <= 15620 {
            arrayOfDate[8] = "Эпоха Змея"
            arrayOfDate[9] = "Бог-Покровитель Съмарглъ"
        }
    }
    
    func monthAndDay(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 40 {
            arrayOfDate[0] = "Рамхатъ, день \(differenceDay + 1)"
        } else if differenceDay >= 41 && differenceDay <= 80 {
            arrayOfDate[0] = "Айлѣтъ, день \(differenceDay - 40)"
        } else if differenceDay >= 81 && differenceDay <= 121 {
            arrayOfDate[0] = "Бейлѣтъ, день \(differenceDay - 80)"
        } else if differenceDay >= 122 && differenceDay <= 161 {
            arrayOfDate[0] = "Гэйлѣтъ, день \(differenceDay - 121)"
        } else if differenceDay >= 162 && differenceDay <= 202 {
            arrayOfDate[0] = "Дайлѣтъ, день \(differenceDay - 161)"
        } else if differenceDay >= 203 && differenceDay <= 242 {
            arrayOfDate[0] = "Элѣтъ, день \(differenceDay - 202)"
        } else if differenceDay >= 243 && differenceDay <= 283 {
            arrayOfDate[0] = "Вэйлѣтъ, день \(differenceDay - 242)"
        } else if differenceDay >= 284 && differenceDay <= 323 {
            arrayOfDate[0] = "Хейлѣтъ, день \(differenceDay - 283)"
        } else if differenceDay >= 324 && differenceDay <= 364 {
            arrayOfDate[0] = "Тайлѣтъ, день \(differenceDay - 323)"
        }
    }
    
    func monthAndDay_16(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 40 {
            arrayOfDate[0] = "Рамхатъ, день \(differenceDay + 1)"
        } else if differenceDay >= 41 && differenceDay <= 81 {
            arrayOfDate[0] = "Айлѣтъ, день \(differenceDay - 40)"
        } else if differenceDay >= 82 && differenceDay <= 122 {
            arrayOfDate[0] = "Бейлѣтъ, день \(differenceDay - 81)"
        } else if differenceDay >= 123 && differenceDay <= 163 {
            arrayOfDate[0] = "Гэйлѣтъ, день \(differenceDay - 122)"
        } else if differenceDay >= 164 && differenceDay <= 204 {
            arrayOfDate[0] = "Дайлѣтъ, день \(differenceDay - 163)"
        } else if differenceDay >= 205 && differenceDay <= 245 {
            arrayOfDate[0] = "Элѣтъ, день \(differenceDay - 204)"
        } else if differenceDay >= 246 && differenceDay <= 286 {
            arrayOfDate[0] = "Вэйлѣтъ, день \(differenceDay - 245)"
        } else if differenceDay >= 287 && differenceDay <= 327 {
            arrayOfDate[0] = "Хейлѣтъ, день \(differenceDay - 286)"
        } else if differenceDay >= 328 && differenceDay <= 368 {
            arrayOfDate[0] = "Тайлѣтъ, день \(differenceDay - 327)"
        }
    }
    
    func customDate(day: Int, month: Int, year: Int, timeAfter18: Bool) -> [String] {
        if month >= 1 && month <= 9 {
            let oldY = year + 5508
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = Int(Double(year + 4).truncatingRemainder(dividingBy: 144))
            
            if month == 9 {
                if oldYearsNumber >= 0 && oldYearsNumber <= 3 {
                    if (day == 22 && timeAfter18 == true) ||  day > 22 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 22 && timeAfter18 == false) || day < 22 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 4 && oldYearsNumber <= 7 {
                    if (day == 21 && timeAfter18 == true) ||  day > 21 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 21 && timeAfter18 == false) || day < 21 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 8 && oldYearsNumber <= 11 {
                    if (day == 20 && timeAfter18 == true) ||  day > 20 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 20 && timeAfter18 == false) || day < 20 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
                else if oldYearsNumber >= 12 && oldYearsNumber <= 15 {
                    if (day == 19 && timeAfter18 == true) ||  day > 19 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                    else if (day == 19 && timeAfter18 == false) || day < 19 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                    }
                }
            }
            else {
                addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
            }
        }
        else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = Int(Double(year + 5).truncatingRemainder(dividingBy: 144))
            addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
        }
        
//        let differenceSecond = getDifferenceTime(year: year, month: month, day: day)
//        let differenceDay = differenceSecond / (16 * 90 * 60)
//        print(differenceDay)
//
//
//        if differenceDay >= 0 && differenceDay <= 40 {
//            arrayOfDate[0] = "Рамхатъ, день \(differenceDay + 1)"
//        } else if differenceDay >= 41 && differenceDay <= 80 {
//            arrayOfDate[0] = "Айлѣтъ, день \(differenceDay - 40)"
//        } else if differenceDay >= 81 && differenceDay <= 121 {
//            arrayOfDate[0] = "Бейлѣтъ, день \(differenceDay - 80)"
//        } else if differenceDay >= 122 && differenceDay <= 161 {
//            arrayOfDate[0] = "Гэйлѣтъ, день \(differenceDay - 121)"
//        } else if differenceDay >= 162 && differenceDay <= 202 {
//            arrayOfDate[0] = "Дайлѣтъ, день \(differenceDay - 161)"
//        } else if differenceDay >= 203 && differenceDay <= 242 {
//            arrayOfDate[0] = "Элѣтъ, день \(differenceDay - 202)"
//        } else if differenceDay >= 243 && differenceDay <= 283 {
//            arrayOfDate[0] = "Вэйлѣтъ, день \(differenceDay - 242)"
//        } else if differenceDay >= 284 && differenceDay <= 323 {
//            arrayOfDate[0] = "Хейлѣтъ, день \(differenceDay - 283)"
//        } else if differenceDay >= 324 && differenceDay <= 364 {
//            arrayOfDate[0] = "Тайлѣтъ, день \(differenceDay - 323)"
//        }
        
//        let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
//        if oldDayOfWeek != 0 {
//            arrayOfDate[1] = (OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1))
//        } else {
//            arrayOfDate[1] = (OldDaysOfWeek.init().dayOfWeek(day: 8))
//        }
        
//        if differenceDay >= 0 && differenceDay <= 20 {
//            arrayOfDate[2] = "Чертог Вепря"
//            arrayOfDate[3] = "Бог-Покровитель Рамхатъ"
//        } else if differenceDay >= 21 && differenceDay <= 43 {
//            arrayOfDate[2] = "Чертог Щуки"
//            arrayOfDate[3] = "Богиня-Покровительница Рожана"
//        } else if differenceDay >= 44 && differenceDay <= 64 {
//            arrayOfDate[2] = "Чертог Лебедя"
//            arrayOfDate[3] = "Богиня-Покровительница Макошь"
//        } else if differenceDay >= 65 && differenceDay <= 86 {
//            arrayOfDate[2] = "Чертог Змея"
//            arrayOfDate[3] = "Бог-Покровитель Съмарглъ"
//        } else if differenceDay >= 87 && differenceDay <= 108 {
//            arrayOfDate[2] = "Чертог Ворона"
//            arrayOfDate[3] = "Бог-Покровитель Колѧда"
//        } else if differenceDay >= 109 && differenceDay <= 132 {
//            arrayOfDate[2] = "Чертог Медведя"
//            arrayOfDate[3] = "Бог-Покровитель Сварогъ"
//        } else if differenceDay >= 133 && differenceDay <= 157 {
//            arrayOfDate[2] = "Чертог Бусла"
//            arrayOfDate[3] = "Бог-Покровитель Родъ"
//        } else if differenceDay >= 158 && differenceDay <= 182 {
//            arrayOfDate[2] = "Чертог Волка"
//            arrayOfDate[3] = "Бог-Покровитель Вьлесе"
//        } else if differenceDay >= 183 && differenceDay <= 205 {
//            arrayOfDate[2] = "Чертог Лисы"
//            arrayOfDate[3] = "Богиня-Покровительница Мара"
//        } else if differenceDay >= 206 && differenceDay <= 227 {
//            arrayOfDate[2] = "Чертог Тура"
//            arrayOfDate[3] = "Бог-Покровитель Крышьнь"
//        } else if differenceDay >= 228 && differenceDay <= 250 {
//            arrayOfDate[2] = "Чертог Лося"
//            arrayOfDate[3] = "Богиня-Покровительница Лада"
//        } else if differenceDay >= 251 && differenceDay <= 272 {
//            arrayOfDate[2] = "Чертог Финиста"
//            arrayOfDate[3] = "Бог-Покровитель Вышьнь"
//        } else if differenceDay >= 273 && differenceDay <= 295 {
//            arrayOfDate[2] = "Чертог Коня"
//            arrayOfDate[3] = "Бог-Покровитель Кѫпала"
//        } else if differenceDay >= 296 && differenceDay <= 317 {
//            arrayOfDate[2] = "Чертог Орла"
//            arrayOfDate[3] = "Бог-Покровитель Перуне"
//        } else if differenceDay >= 318 && differenceDay <= 340 {
//            arrayOfDate[2] = "Чертог Раса"
//            arrayOfDate[3] = "Бог-Покровитель Тархъ"
//        } else if differenceDay >= 341 && differenceDay <= 364 {
//            arrayOfDate[2] = "Чертог Девы"
//            arrayOfDate[3] = "Бог-Покровитель Джива"
//        }
        
        return arrayOfDate
    }
}
