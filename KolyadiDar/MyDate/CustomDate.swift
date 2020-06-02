//
//  CustomDate.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 29.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import Foundation

class CustomDate {
    
    //var myDate = MyDateViewController()
    
    var currentDate = CurrentDate()
    
    let currentVC = CurrentViewController()
    
    var arrayOfDate: [String] = ["", "", "", "", "", "", "", "", "", "", ""]
    
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
        arrayOfDate[5] = "Лѣто \(oldY) от С.З.М.Х."
        arrayOfDate[6] = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        arrayOfDate[7] = "\(oldyearsNumber) лѣто в Круге лѣт"
        arrayOfDate[8] = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        yearsOfEpoha(oldYear: oldY)
    }
    
    func addYearPlusOne(oldY: Int, oldYearsNumber: Int, oldYearsNumberInRoundOfLife: Int) {
        let oldy = oldY + 1
        let oldyearsNumber = oldYearsNumber + 1
        let oldyearsNumberInRoundOfLife = oldYearsNumberInRoundOfLife + 1
        arrayOfDate[5] = "Лѣто \(oldy) от С.З.М.Х."
        arrayOfDate[6] = "\(OldYear().arrayOfTitleOfYears[oldyearsNumberInRoundOfLife - 1])"
        arrayOfDate[7] = "\(oldyearsNumber) лѣто в Круге лѣт"
        arrayOfDate[8] = "\(oldyearsNumberInRoundOfLife) лѣто в Круге жизни"
        yearsOfEpoha(oldYear: oldy)
    }
    
    func yearsOfEpoha(oldYear: Int) {
        if oldYear >= 4280 && oldYear <= 5900 {
            arrayOfDate[9] = "Эпоха Тура"
            arrayOfDate[10] = "Бог-Покровитель Крышьнь"
        } else if oldYear >= 5901 && oldYear < 7521 {
            arrayOfDate[9] = "Эпоха Лисы"
            arrayOfDate[10] = "Богиня-Покровительница Мара"
        } else if oldYear >= 7521 && oldYear <= 9140 {
            arrayOfDate[9] = "Эпоха Волка"
            arrayOfDate[10] = "Бог-Покровитель Вьлесе"
        } else if oldYear >= 9141 && oldYear <= 10760 {
            arrayOfDate[9] = "Эпоха Бусла"
            arrayOfDate[10] = "Бог-Покровитель Родъ"
        } else if oldYear >= 10761 && oldYear <= 12380 {
            arrayOfDate[9] = "Эпоха Медведя"
            arrayOfDate[10] = "Бог-Покровитель Сварогъ"
        } else if oldYear >= 12381 && oldYear <= 14000 {
            arrayOfDate[9] = "Эпоха Ворона"
            arrayOfDate[10] = "Бог-Покровитель Колѧда"
        } else if oldYear >= 14001 && oldYear <= 15620 {
            arrayOfDate[9] = "Эпоха Змея"
            arrayOfDate[10] = "Бог-Покровитель Съмарглъ"
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
    
    func oldDaysOfWeek(differenceDay: Int, oldYear: Int) {
        print(differenceDay)
        let oldDayOfWeek = Int(Double(differenceDay).truncatingRemainder(dividingBy: 9))
        print(oldDayOfWeek)
        print(oldYear)
        if oldDayOfWeek != 0 {
            
            arrayOfDate[1] = OldDaysOfWeek.init().dayOfWeekForOldYear (oldYear: oldYear, day: oldDayOfWeek)
            //arrayOfDate[1] = OldDaysOfWeek.init().dayOfWeek(day: oldDayOfWeek - 1)
        } else {
            arrayOfDate[1] = OldDaysOfWeek.init().dayOfWeekForOldYear (oldYear: oldYear, day: 8)
            //arrayOfDate[1] = OldDaysOfWeek.init().dayOfWeek(day: 8)
        }
    }
    
    func daysOfConstellations(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 20 {
            arrayOfDate[2] = "Чертог Вепря"
            arrayOfDate[3] = "Бог-Покровитель Рамхатъ"
            arrayOfDate[4] = "Груша"
        } else if differenceDay >= 21 && differenceDay <= 43 {
            arrayOfDate[2] = "Чертог Щуки"
            arrayOfDate[3] = "Богиня-Покровительница Рожана"
            arrayOfDate[4] = "Слива"
        } else if differenceDay >= 44 && differenceDay <= 64 {
            arrayOfDate[2] = "Чертог Лебедя"
            arrayOfDate[3] = "Богиня-Покровительница Макошь"
            arrayOfDate[4] = "Сосна"
        } else if differenceDay >= 65 && differenceDay <= 86 {
            arrayOfDate[2] = "Чертог Змея"
            arrayOfDate[3] = "Бог-Покровитель Съмарглъ"
            arrayOfDate[4] = "Липа"
        } else if differenceDay >= 87 && differenceDay <= 108 {
            arrayOfDate[2] = "Чертог Ворона"
            arrayOfDate[3] = "Бог-Покровитель Колѧда"
            arrayOfDate[4] = "Лиственница"
        } else if differenceDay >= 109 && differenceDay <= 132 {
            arrayOfDate[2] = "Чертог Медведя"
            arrayOfDate[3] = "Бог-Покровитель Сварогъ"
            arrayOfDate[4] = "Малина, Бук"
        } else if differenceDay >= 133 && differenceDay <= 157 {
            arrayOfDate[2] = "Чертог Бусла"
            arrayOfDate[3] = "Бог-Покровитель Родъ"
            arrayOfDate[4] = "Ива"
        } else if differenceDay >= 158 && differenceDay <= 182 {
            arrayOfDate[2] = "Чертог Волка"
            arrayOfDate[3] = "Бог-Покровитель Вьлесе"
            arrayOfDate[4] = "Тополь"
        } else if differenceDay >= 183 && differenceDay <= 205 {
            arrayOfDate[2] = "Чертог Лисы"
            arrayOfDate[3] = "Богиня-Покровительница Мара"
            arrayOfDate[4] = "Граб, Смородина"
        } else if differenceDay >= 206 && differenceDay <= 227 {
            arrayOfDate[2] = "Чертог Тура"
            arrayOfDate[3] = "Бог-Покровитель Крышьнь"
            arrayOfDate[4] = "Осина"
        } else if differenceDay >= 228 && differenceDay <= 250 {
            arrayOfDate[2] = "Чертог Лося"
            arrayOfDate[3] = "Богиня-Покровительница Лада"
            arrayOfDate[4] = "Береза"
        } else if differenceDay >= 251 && differenceDay <= 272 {
            arrayOfDate[2] = "Чертог Финиста"
            arrayOfDate[3] = "Бог-Покровитель Вышьнь"
            arrayOfDate[4] = "Вишня"
        } else if differenceDay >= 273 && differenceDay <= 295 {
            arrayOfDate[2] = "Чертог Коня"
            arrayOfDate[3] = "Бог-Покровитель Кѫпала"
            arrayOfDate[4] = "Папоротник, Вяз"
        } else if differenceDay >= 296 && differenceDay <= 317 {
            arrayOfDate[2] = "Чертог Орла"
            arrayOfDate[3] = "Бог-Покровитель Перуне"
            arrayOfDate[4] = "Дуб"
        } else if differenceDay >= 318 && differenceDay <= 340 {
            arrayOfDate[2] = "Чертог Раса"
            arrayOfDate[3] = "Бог-Покровитель Тархъ"
            arrayOfDate[4] = "Ясень, Игг"
        } else if differenceDay >= 341 && differenceDay <= 364 {
            arrayOfDate[2] = "Чертог Девы"
            arrayOfDate[3] = "Бог-Покровитель Джива"
            arrayOfDate[4] = "Яблоня"
        }
    }
    
    func daysOfConstellations_16(differenceDay: Int) {
        if differenceDay >= 0 && differenceDay <= 20 {
            arrayOfDate[2] = "Чертог Вепря"
            arrayOfDate[3] = "Бог-Покровитель Рамхатъ"
            arrayOfDate[4] = "Груша"
        } else if differenceDay >= 21 && differenceDay <= 43 {
            arrayOfDate[2] = "Чертог Щуки"
            arrayOfDate[3] = "Богиня-Покровительница Рожана"
            arrayOfDate[4] = "Слива"
        } else if differenceDay >= 44 && differenceDay <= 64 {
            arrayOfDate[2] = "Чертог Лебедя"
            arrayOfDate[3] = "Богиня-Покровительница Макошь"
            arrayOfDate[4] = "Сосна"
        } else if differenceDay >= 65 && differenceDay <= 87 {
            arrayOfDate[2] = "Чертог Змея"
            arrayOfDate[3] = "Бог-Покровитель Съмарглъ"
            arrayOfDate[4] = "Липа"
        } else if differenceDay >= 88 && differenceDay <= 109 {
            arrayOfDate[2] = "Чертог Ворона"
            arrayOfDate[3] = "Бог-Покровитель Колѧда"
            arrayOfDate[4] = "Лиственница"
        } else if differenceDay >= 110 && differenceDay <= 133 {
            arrayOfDate[2] = "Чертог Медведя"
            arrayOfDate[3] = "Бог-Покровитель Сварогъ"
            arrayOfDate[4] = "Малина, Бук"
        } else if differenceDay >= 134 && differenceDay <= 159 {
            arrayOfDate[2] = "Чертог Бусла"
            arrayOfDate[3] = "Бог-Покровитель Родъ"
            arrayOfDate[4] = "Ива"
        } else if differenceDay >= 160 && differenceDay <= 184 {
            arrayOfDate[2] = "Чертог Волка"
            arrayOfDate[3] = "Бог-Покровитель Вьлесе"
            arrayOfDate[4] = "Тополь"
        } else if differenceDay >= 185 && differenceDay <= 207 {
            arrayOfDate[2] = "Чертог Лисы"
            arrayOfDate[3] = "Богиня-Покровительница Мара"
            arrayOfDate[4] = "Граб, Смородина"
        } else if differenceDay >= 208 && differenceDay <= 229 {
            arrayOfDate[2] = "Чертог Тура"
            arrayOfDate[3] = "Бог-Покровитель Крышьнь"
            arrayOfDate[4] = "Осина"
        } else if differenceDay >= 230 && differenceDay <= 253 {
            arrayOfDate[2] = "Чертог Лося"
            arrayOfDate[3] = "Богиня-Покровительница Лада"
            arrayOfDate[4] = "Береза"
        } else if differenceDay >= 254 && differenceDay <= 275 {
            arrayOfDate[2] = "Чертог Финиста"
            arrayOfDate[3] = "Бог-Покровитель Вышьнь"
            arrayOfDate[4] = "Вишня"
        } else if differenceDay >= 276 && differenceDay <= 298 {
            arrayOfDate[2] = "Чертог Коня"
            arrayOfDate[3] = "Бог-Покровитель Кѫпала"
            arrayOfDate[4] = "Папоротник, Вяз"
        } else if differenceDay >= 299 && differenceDay <= 320 {
            arrayOfDate[2] = "Чертог Орла"
            arrayOfDate[3] = "Бог-Покровитель Перуне"
            arrayOfDate[4] = "Дуб"
        } else if differenceDay >= 321 && differenceDay <= 344 {
            arrayOfDate[2] = "Чертог Раса"
            arrayOfDate[3] = "Бог-Покровитель Тархъ"
            arrayOfDate[4] = "Ясень, Игг"
        } else if differenceDay >= 345 && differenceDay <= 368 {
            arrayOfDate[2] = "Чертог Девы"
            arrayOfDate[3] = "Бог-Покровитель Джива"
            arrayOfDate[4] = "Яблоня"
        }
    }
    
    func differenceTime(startYear: Int, finishYear: Int, startMonth: Int, finishMonth: Int, startDay: Int, finishDay: Int, startHour: Int, finishHour: Bool) -> Int {
        let calendar = Calendar.current
        var startDateComponents = DateComponents()
        
        startDateComponents.year = startYear
        startDateComponents.month = startMonth
        startDateComponents.day = startDay
        startDateComponents.hour = startHour
        
        var finishDateComponents = DateComponents()
        
        finishDateComponents.year = finishYear
        finishDateComponents.month = finishMonth
        finishDateComponents.day = finishDay
        if finishHour == false {
            finishDateComponents.hour = 17
        } else if finishHour == true {
            finishDateComponents.hour = 19
        }
        
        
        let startDateFromDC = calendar.date(from: startDateComponents as DateComponents)
        let finishDateFromDC = calendar.date(from: finishDateComponents as DateComponents)
        
        let difference = Int(((finishDateFromDC?.timeIntervalSince(startDateFromDC!))!))
        print(difference)
        
        // вывод в секундах
        return difference
    }
    
    func oldMonthNew(oldYearsNumber: Int, year: Int, month: Int, day: Int, timeAfterSixPM: Bool) {
        let oldYearsNumberInRoundOfLife = Int(Double(year + 4).truncatingRemainder(dividingBy: 144))
        
        var startYear: Int = 0
        if month >= 1 && month <= 9 {
            if month == 9 {
                if oldYearsNumber >= 1 && oldYearsNumber <= 3 {
                    startYear = year - 1
                    
                    
                    
                }
                    
            }
             
        }
            if oldYearsNumber >= 1 && oldYearsNumber <= 3 {
                var startYear: Int = 0
                if month >= 1 && month <= 9 {
                    if month == 9 {
                        if (day == 22 && timeAfterSixPM == false) || day < 22 {
                            startYear = year - 1
                            print(startYear, oldYearsNumber)
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                
                daysOfConstellations(differenceDay: differenceDay)
                
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
            }
            else if oldYearsNumber == 8 {
                print("Лето \(oldYearsNumber)")
                var startYear: Int = 0
                var startDay: Int = 0
                if month >= 1 && month <= 9 {
                    if month == 9 {
                        if (day == 20 && timeAfterSixPM == false) || day < 20 {
                            startYear = year - 1
                            startDay = 21 - 1
                        } else if (day == 20 && timeAfterSixPM == true) ||  day > 20 {
                            startYear = year
                            startDay = 21
                        }
                    } else {
                        startYear = year - 1
                        startDay = 21 - 1
                    }
                } else if month >= 10 && month <= 12 {
                    startYear = year
                    startDay = 21
                }
                let startMonth = 9
                
                let startHour = 18
                
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
            }
            else if oldYearsNumber >= 9 && oldYearsNumber <= 11 {
                print("Лето \(oldYearsNumber)")
                var startYear: Int = 0
                if month >= 1 && month <= 9 {
                    print("Месяц \(month) Лето \(oldYearsNumber)")
                    if month == 9 {
                        print(day)
                        if (day == 20 && timeAfterSixPM == false) || day < 20 {
                            startYear = year - 1
                        } else if (day == 20 && timeAfterSixPM == true) ||  day > 20 {
                            startYear = year
                        }
                    } else {
                        startYear = year - 1
                    }
                } else if month >= 10 && month <= 12 {
                    print("Месяц \(month) Лето \(oldYearsNumber)")
                    startYear = year
                }
                let startMonth = 9
                let startDay = 20
                let startHour = 18
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                print(differenceDay)
                monthAndDay(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations(differenceDay: differenceDay)
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
                let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
                monthAndDay_16(differenceDay: differenceDay)
                //oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
                daysOfConstellations_16(differenceDay: differenceDay)
                
    //            monthAndDay_16(differenceDay: differenceDay)
    //            oldDaysOfWeek(differenceDay: differenceDay)
    //            daysOfConstellations_16(differenceDay: differenceDay)
            }
        }
    
    func oldMonth(oldYearsNumber: Int, oldYearsNumberInRoundOfLife: Int, year: Int, month: Int, day: Int, timeAfterSixPM: Bool) {
        if oldYearsNumber >= 1 && oldYearsNumber <= 3 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 22 && timeAfterSixPM == false) || day < 22 {
                        startYear = year - 1
                        print(startYear, oldYearsNumber)
                    }
                } else {
                    startYear = year - 1
                    print(startYear, oldYearsNumber)
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
                print(startYear, oldYearsNumber)
            }
            let startMonth = 9
            let startDay = 22
            let startHour = 18
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            
            daysOfConstellations(differenceDay: differenceDay)
            
        }
        else if oldYearsNumber == 4 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && timeAfterSixPM == false) || day < 21 {
                        startYear = year - 1
                        print(startYear, oldYearsNumber)
                    }
                } else {
                    startYear = year - 1
                    print(startYear, oldYearsNumber)
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
                print(startYear, oldYearsNumber)
            }
            let startMonth = 9
            let startDay = 22
            let startHour = 18
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
        }
        else if oldYearsNumber >= 5 && oldYearsNumber <= 7 {
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 21 && timeAfterSixPM == false) || day < 21 {
                        startYear = year - 1
                        print(startYear, oldYearsNumber)
                    }
                } else {
                    startYear = year - 1
                    print(startYear, oldYearsNumber)
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
                print(startYear, oldYearsNumber)
            }
            let startMonth = 9
            let startDay = 21
            let startHour = 18
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
        }
        else if oldYearsNumber == 8 {
            print("Лето \(oldYearsNumber)")
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                if month == 9 {
                    if (day == 20 && timeAfterSixPM == false) || day < 20 {
                        startYear = year - 1
                        print(startYear, oldYearsNumber)
                    } else if (day == 20 && timeAfterSixPM == true) ||  day > 20 {
                        startYear = year
                        print(startYear, oldYearsNumber)
                    }
                } else {
                    startYear = year - 1
                    print(startYear, oldYearsNumber)
                }
            } else if month >= 10 && month <= 12 {
                startYear = year
                print(startYear, oldYearsNumber)
            }
            let startMonth = 9
            let startDay = 21
            let startHour = 18
            
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
        }
        else if oldYearsNumber >= 9 && oldYearsNumber <= 11 {
            print("Лето \(oldYearsNumber)")
            var startYear: Int = 0
            if month >= 1 && month <= 9 {
                print("Месяц \(month)")
                if month == 9 {
                    print(day)
                    if (day == 20 && timeAfterSixPM == false) || day < 20 {
                        startYear = year - 1
                    } else if (day == 20 && timeAfterSixPM == true) ||  day > 20 {
                        startYear = year
                    }
                } else {
                    startYear = year - 1
                }
            } else if month >= 10 && month <= 12 {
                print("Месяц \(month)")
                startYear = year
            }
            let startMonth = 9
            let startDay = 20
            let startHour = 18
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
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
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
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
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            print(differenceDay)
            monthAndDay(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations(differenceDay: differenceDay)
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
            let differenceDay = differenceTime(startYear: startYear, finishYear: year, startMonth: startMonth, finishMonth: month, startDay: startDay, finishDay: day, startHour: startHour, finishHour: timeAfterSixPM) / (60 * 90 * 16)
            monthAndDay_16(differenceDay: differenceDay)
            oldDaysOfWeek(differenceDay: differenceDay, oldYear: oldYearsNumberInRoundOfLife)
            daysOfConstellations_16(differenceDay: differenceDay)
            
//            monthAndDay_16(differenceDay: differenceDay)
//            oldDaysOfWeek(differenceDay: differenceDay)
//            daysOfConstellations_16(differenceDay: differenceDay)
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
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                    else if (day == 22 && timeAfter18 == false) || day < 22 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                }
                else if oldYearsNumber >= 4 && oldYearsNumber <= 7 {
                    if (day == 21 && timeAfter18 == true) ||  day > 21 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                    else if (day == 21 && timeAfter18 == false) || day < 21 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                }
                else if oldYearsNumber >= 8 && oldYearsNumber <= 11 {
                    if (day == 20 && timeAfter18 == true) ||  day > 20 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                    else if (day == 20 && timeAfter18 == false) || day < 20 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                }
                else if oldYearsNumber >= 12 && oldYearsNumber <= 15 {
                    if (day == 19 && timeAfter18 == true) ||  day > 19 {
                        addYearPlusOne(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                    else if (day == 19 && timeAfter18 == false) || day < 19 {
                        addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                        oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
                    }
                }
            }
            else {
                addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
                oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
            }
        }
        else if month >= 10 && month <= 12 {
            let oldY = year + 5509
            let oldYearsNumber = Int(Double(oldY).truncatingRemainder(dividingBy: 16))
            let oldYearsNumberInRoundOfLife = Int(Double(year + 5).truncatingRemainder(dividingBy: 144))
            addYear(oldY: oldY, oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife)
            oldMonth(oldYearsNumber: oldYearsNumber, oldYearsNumberInRoundOfLife: oldYearsNumberInRoundOfLife, year: year, month: month, day: day, timeAfterSixPM: timeAfter18)
        }
        
        return arrayOfDate
    }
}
