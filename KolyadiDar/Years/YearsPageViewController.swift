//
//  YearsPageViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 26.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class YearsPageViewController: UIPageViewController {
    
    var yearTitle = ""
    //var mainArrayOfSymbol: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        // при загрузке PageViewCintroller отобразится ViewController с переданным значением
        if let contentViewController = showViewControllerAtIndex(OldYear().arrayOfAdvtitleOfYears.firstIndex(of: yearTitle)!) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func showViewControllerAtIndex (_ index: Int) -> YearViewController? {
        guard index >= 0 else { return nil }
        guard index < OldYear().arrayOfAdvtitleOfYears.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "YearDetails") as? YearViewController else { return nil }
        contentVC.yearTitleVC = OldYear().arrayOfAdvtitleOfYears[index]
        contentVC.currentPageVC = index
        contentVC.yearsCount = OldYear().arrayOfAdvtitleOfYears.count
        
        return contentVC
    }
}

extension YearsPageViewController: UIPageViewControllerDataSource {
    // пролистывание свайпом назад
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var currentNumberOfPage = (viewController as! YearViewController).currentPageVC
        currentNumberOfPage -= 1
        return showViewControllerAtIndex(currentNumberOfPage)
    }
    
    // пролистывание свайпом вперед
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var currentNumberOfPage = (viewController as! YearViewController).currentPageVC
        currentNumberOfPage += 1
        return showViewControllerAtIndex(currentNumberOfPage)
    }
    
    
}
