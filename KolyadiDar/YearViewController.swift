//
//  YearViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 26.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class YearViewController: UIViewController {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var aboutOfYear: UILabel!
    
    var yearTitleVC = ""
    var currentPageVC = 0
    var yearsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        yearLabel.text = yearTitleVC
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
