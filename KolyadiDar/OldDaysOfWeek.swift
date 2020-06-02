//
//  OldDays.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 19.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import Foundation

struct OldDaysOfWeek {
    
    let yearsForFirstDayOfWeek: [Int] = [1, 10, 20, 29, 39, 48, 49, 58, 68, 77, 87, 96, 97, 106, 116, 125, 135, 144]
    let firstDayOfWeek: [String] = ["Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля"]
    
    let yearsForSecondDayOfWeek: [Int] = [3, 12, 22, 31, 41, 51, 60, 70, 79, 89, 99, 108, 118, 127, 137]
    let secondDayOfWeek: [String] = ["Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля", "Понедѣльникъ"]
    
    let yearsForThirdDayOfWeek: [Int] = [5, 14, 24, 34, 43, 53, 62, 72, 82, 91, 101, 110, 120, 130, 139]
    let thirdDayOfWeek: [String] = ["Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ"]
    
    let yearsForFourthDayOfWeek: [Int] = [7, 16, 17, 26, 26, 45, 55, 64, 65, 74, 84, 93, 103, 112, 113, 122, 132, 141]
    let fourthDayOfWeek: [String] = ["Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ"]
    
    let yearsForFifthDayOfWeek: [Int] = [9, 19, 28, 38, 47, 57, 67, 76, 86, 95, 105, 115, 124, 134, 143]
    let fifthDayOfWeek: [String] = ["Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ"]
    
    let yearsForSixthDayOfWeek: [Int] = [2, 11, 21, 30, 40, 50, 59, 69, 78, 88, 98, 107, 117, 126, 136]
    let sixthDayOfWeek: [String] = ["Шестица", "Седмица", "Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница"]
    
    let yearsForSeventhDayOfWeek: [Int] = [4, 13, 23, 32, 33, 42, 52, 61, 71, 80, 81, 90, 100, 109, 119, 128, 129, 138]
    let seventhDayOfWeek: [String] = ["Седмица", "Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица"]
    
    let yearsForEighthDayOfWeek: [Int] = [6, 15, 25, 35, 44, 54, 63, 73, 83, 92, 102, 111, 121, 131, 140]
    let eighthDayOfWeek: [String] = ["Осьмица", "Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица"]
    
    let yearsForNinthDayOfWeek: [Int] = [8, 18, 27, 37, 46, 56, 66, 75, 85, 94, 104, 114, 123, 133, 142]
    let ninthDayOfWeek: [String] = ["Недѣля", "Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица"]
    
    
    
    func numberOfOldYear(yearOfLife: Int, day: Int) -> String {
        var arrayOfDaysForYear: [String] = []
        for oldYear in yearsForFirstDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = firstDayOfWeek
            }
        }
        for oldYear in yearsForSecondDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = secondDayOfWeek
            }
        }
        for oldYear in yearsForThirdDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = thirdDayOfWeek
            }
        }
        for oldYear in yearsForFourthDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = fourthDayOfWeek
            }
        }
        for oldYear in yearsForFifthDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = fifthDayOfWeek
            }
        }
        for oldYear in yearsForSixthDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = sixthDayOfWeek
            }
        }
        for oldYear in yearsForSeventhDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = seventhDayOfWeek
            }
        }
        for oldYear in yearsForEighthDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = eighthDayOfWeek
            }
        }
        for oldYear in yearsForNinthDayOfWeek {
            if yearOfLife == oldYear {
                arrayOfDaysForYear = ninthDayOfWeek
            }
        }
        return arrayOfDaysForYear[day]
    }
    
    func dayOfWeekForOldYear (oldYear: Int, day: Int) -> String {
        return numberOfOldYear(yearOfLife: oldYear, day: day)
    }
    
    
    
    
    
    
    let daysOfWeek: [String] = ["Понедѣльникъ", "Вторникъ", "Тритейникъ", "Четвергъ", "Пятница", "Шестица", "Седмица", "Осьмица", "Недѣля"]
    
    let shortDaysOfWeek: [String] = ["Пн.", "Вт.", "Тр.", "Чт.", "Пт.", "Шт.", "Сд.", "Ом.", "Нд."]
    
    let planetsOfDaysOfWeek: [String] = ["День Земли Хорса", "День Земли Орея", "День Земли Перуна", "День Земли Варуны", "День Земли Индры", "День Земли Стрибога", "День Земли (Деи) Сварга", "День Земли Зари-Мерцаны", "День Ярилы-Солнца"]
    
    let planetsOfGods: [String] = ["Меркурий", "Марс", "Юпитер", "Уран", "Хирон ", "Сатурн", "Пояс астероидов", "Венера", ""]
    
    func dayOfWeek (day: Int) -> String {
        return daysOfWeek[day]
    }
    
    func shortDayOfWeek (day: Int) -> String {
        return shortDaysOfWeek[day]
    }
    
    func planetsOfDaysOfWeek (day: Int) -> String {
        return planetsOfDaysOfWeek[day]
    }
    
    func planetsOfGods (day: Int) -> String {
        return planetsOfGods[day]
    }
}
