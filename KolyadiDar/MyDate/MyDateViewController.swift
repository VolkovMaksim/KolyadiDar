//
//  MyDateViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 06.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class MyDateViewController: UIViewController {
    @IBOutlet weak var dateTF: MyDateTextField!
    @IBOutlet weak var timeOfDayLabel: UILabel!
    
    @IBOutlet weak var monthAndDayLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var titleOfConstellationLabel: UILabel!
    @IBOutlet weak var nameOfGodLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleOfYearLabel: UILabel!
    @IBOutlet weak var yearInRoundOfYearsLabel: UILabel!
    @IBOutlet weak var yearInRoundOfLifeLabel: UILabel!
    @IBOutlet weak var epohaLabel: UILabel!
    @IBOutlet weak var epohaGodLabel: UILabel!
    
    @IBOutlet weak var yearInfoLabel: UIButton!
    @IBOutlet weak var checkDateLabel: UIButton!
    
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    let dPickerView: UIDatePicker = UIDatePicker()
    let myDate = CustomDate()
    var oldYear = OldYear()
    var titleOfYear = ""
    
    // переменная для участия расчета даты "после" или "до" 18 часов
    var timeAfter18: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        monthAndDayLabel.isHidden = true
        dayOfWeekLabel.isHidden = true
        titleOfConstellationLabel.isHidden = true
        nameOfGodLabel.isHidden = true
        yearLabel.isHidden = true
        titleOfYearLabel.isHidden = true
        yearInRoundOfYearsLabel.isHidden = true
        yearInRoundOfLifeLabel.isHidden = true
        checkDateLabel.isHidden = true
        yearInfoLabel.isHidden = true
        epohaLabel.isHidden = true
        epohaGodLabel.isHidden = true
        dateTF.text = ""
        super.viewDidLoad()
        setTime()
    }
    
    // отображение даты из DatePicker в TextField
    @objc func handelDatePicker() {
        dateTF.text = dateFormatter.string(from: dPickerView.date)
        checkDateLabel.isHidden = false
    }
    
    // в этой функции создается колдунство с участием DatePicker и TextField
    func setTime(){
        // DatePicker отображает только дату
        dPickerView.datePickerMode = .date
        // DatePicker с русской локализацией
        dPickerView.locale = Locale(identifier: "ru_RU")
        // благодаря строке ниже, при тапе на TextField появляется не клава, а DatePicker
        dateTF.inputView = dPickerView
        // формат вывода даты ДД.ММ.ГГГГ
        dateFormatter.dateStyle = .short
        // Формат даты с русской локализацией
        dateFormatter.locale = Locale(identifier: "ru_RU")
        // добавить в TextField дату из DatePicker (работает в связке с func handelDatePicker())
        dPickerView.addTarget(self, action: #selector(handelDatePicker), for: UIControl.Event.valueChanged)
        // если раскомментировать вызов функции ниже, то при переходе на вкладку "Расчет даты"  в TextField сразу будет отображаться текущая дата
        //handelDatePicker()
    }
    
    // до 18 часов или после?
    @IBAction func switchTime(_ sender: UISwitch) {
        if sender.isOn {
            timeOfDayLabel.text = "После 18 часов  "
            timeAfter18 = true
        } else {
            timeOfDayLabel.text = "До 18 часов  "
            timeAfter18 = false
        }
    }
    
    @IBAction func checkDate(_ sender: UIButton) {
        monthAndDayLabel.isHidden = false
        dayOfWeekLabel.isHidden = false
        titleOfConstellationLabel.isHidden = false
        nameOfGodLabel.isHidden = false
        yearLabel.isHidden = false
        titleOfYearLabel.isHidden = false
        yearInRoundOfYearsLabel.isHidden = false
        yearInRoundOfLifeLabel.isHidden = false
        yearInfoLabel.isHidden = false
        epohaLabel.isHidden = false
        epohaGodLabel.isHidden = false
        // скрываем DatePicker при тапе на кнопку chackDate
        self.view.endEditing(true)
        
        let customDate = dPickerView.date
        let day = calendar.component(.day, from: customDate)
        let month = calendar.component(.month, from: customDate)
        let year = calendar.component(.year, from: customDate)
        
        let arrayOfOldDate = myDate.customDate(day: day, month: month, year: year, timeAfter18: timeAfter18)
        monthAndDayLabel.text = arrayOfOldDate[0]
        dayOfWeekLabel.text = arrayOfOldDate[1]
        titleOfConstellationLabel.text = arrayOfOldDate[2]
        nameOfGodLabel.text = arrayOfOldDate[3]
        yearLabel.text = arrayOfOldDate[4]
        titleOfYearLabel.text = arrayOfOldDate[5]
        yearInRoundOfYearsLabel.text = arrayOfOldDate[6]
        yearInRoundOfLifeLabel.text = arrayOfOldDate[7]
        titleOfYear = arrayOfOldDate[5]
        epohaLabel.text = arrayOfOldDate[8]
        epohaGodLabel.text = arrayOfOldDate[9]
    }
    
    // скрываем DatePicker при тапе на view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // если идентификатор сигвея соответствует "DetailPage"
        if segue.identifier == "CustomYearInfo" {
            let pageVC = segue.destination as! YearsPageViewController
            for year in oldYear.arrayOfAdvtitleOfYears {
                if year.contains(titleOfYear) {
                    pageVC.yearTitle = year
                    
                }
            }
        }
    }

}
