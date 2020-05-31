//
//  TodayViewController.swift
//  widget
//
//  Created by Maksim Pavlov on 28.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rpDayImage: UIImageView!
    
    var timer = Timer()
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(liveOldTime), userInfo: Date(), repeats: true)
    }
    
    @objc func liveOldTime() {
        //sepLabel.isHidden = !sepLabel.isHidden
        updateTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTime()
    }
    override func viewDidLoad() {
        rpDayImage.isHidden = true
        super.viewDidLoad()
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
    }
        
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 50)
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 180)
        }
    }
    
    func animateTextLabels() {
        let isExpandedMode = self.extensionContext?.widgetActiveDisplayMode == .expanded
        let scaleText:CGFloat = isExpandedMode ? 3 : 0.3
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
            self.hourLabel.transform = .init(scaleX: scaleText, y: scaleText)
            self.hourLabel.transform = isExpandedMode ? .init(translationX: 0, y: 20) : .identity
        }) { (finished) in
            UIView.animate(withDuration: 0.3, animations: {
                self.hourLabel.transform = .identity
            })
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        let widgetUserDefaults = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")
        let text = widgetUserDefaults?.value(forKey: "hours")
        self.hourLabel.text = text as? String
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func updateTime() {
        if let hours = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "hours") {
            hourLabel.text = hours as? String
        }
        if let minutes = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "minutes") {
            minuteLabel.text = minutes as? String
        }
        if let seconds = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "seconds") {
            secondLabel.text = seconds as? String
        }
        if let month = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "month") {
            monthLabel.text = (month as! String) + ","
        }
        if let year = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "year") {
            yearLabel.text = year as? String
        }
        
        if let dayOfWeek = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "dayOfWeek") {
            dayOfWeekLabel.text = dayOfWeek as? String
        }
        
        if let rpDay = UserDefaults.init(suiteName: "group.ru.superstarper.dev.KolyadiDar")?.value(forKey: "rpDay") {
            rpDayImage.isHidden = false
            rpDayImage.image = UIImage.init(data: rpDay as! Data)
        }
    }
    
}
