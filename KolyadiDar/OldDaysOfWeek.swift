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
    
    func dayOfWeek (day: Int) -> String{
        return daysOfWeek[day]
    }
}
