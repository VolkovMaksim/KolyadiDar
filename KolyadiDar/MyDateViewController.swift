//
//  MyDateViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 06.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class MyDateViewController: UIViewController {
    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var timeOfDay: UILabel!
    
    @IBOutlet weak var monthAndDay: UILabel!
    @IBOutlet weak var titleOfConstellation: UILabel!
    @IBOutlet weak var nameOfGod: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var titleOfYear: UILabel!
    @IBOutlet weak var yearInRoundOfYears: UILabel!
    @IBOutlet weak var yearInRoundOfLife: UILabel!
    
    @IBOutlet weak var checkDateLabel: UIButton!
    
    var timeAfter18: Bool = false
    
    func setTime() {
        guard let dayText = dayTF.text else { return }
        guard let monthText = monthTF.text else { return }
        guard let yearText = yearTF.text else { return }
        
        guard let day = Int(dayText) else { return }
        guard let month = Int(monthText) else { return }
        guard let year = Int(yearText) else { return }
        
        if (day >= 1) && (day <= 31) {
            
        }
        
        if (month >= 1) && (month <= 12) {
            
        }
        
        if year >= 1 {
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 2
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        monthAndDay.isHidden = true
        titleOfConstellation.isHidden = true
        nameOfGod.isHidden = true
        year.isHidden = true
        titleOfYear.isHidden = true
        yearInRoundOfYears.isHidden = true
        yearInRoundOfLife.isHidden = true
        checkDateLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func switchTime(_ sender: UISwitch) {
        if sender.isOn {
            timeOfDay.text = "После 18 часов  "
            timeAfter18 = true
        } else {
            timeOfDay.text = "До 18 часов  "
            timeAfter18 = false
        }
    }
    
    @IBAction func checkDate(_ sender: UIButton) {
        monthAndDay.isHidden = false
        titleOfConstellation.isHidden = false
        nameOfGod.isHidden = false
        year.isHidden = false
        titleOfYear.isHidden = false
        yearInRoundOfYears.isHidden = false
        yearInRoundOfLife.isHidden = false
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
