//
//  OldDays.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 19.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import Foundation

struct OldDaysOfWeek {
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
