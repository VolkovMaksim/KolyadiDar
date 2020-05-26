//
//  YearsTableViewController.swift
//  KolyadiDar
//
//  Created by Maksim Pavlov on 06.05.2020.
//  Copyright © 2020 Maksim Pavlov. All rights reserved.
//

import UIKit

class YearsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return OldYear().arrayOfAdvtitleOfYears.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Year", for: indexPath)
        // настройка изображения в ячейке
        //cell.imageView?.image = UIImage(named: OldYear().arrayOfAdvtitleOfYears[indexPath.row] + "-128")
        // настройка подписи в ячейке
        cell.textLabel?.text = OldYear().arrayOfAdvtitleOfYears[indexPath.row]
        // изменение шрифта на РОДНИКЪ и его размера
        cell.textLabel?.font = UIFont(name: "-Normal", size: 17)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // функция для передачи данных по сегвею "DetailPage"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // если идентификатор сигвея соответствует "DetailPage"
        if segue.identifier == "Year_Segue" {
            // если новая константа принимает значение выбранной ячейки
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // новая константа VC, класса PageViewController, которая будет в конце перехода по сегвею
                let pageVC = segue.destination as! YearsPageViewController
                // установка значения выбранной ячейки для свойства bukvTitle
                pageVC.yearTitle = OldYear().arrayOfAdvtitleOfYears[indexPath.row]
                // установка числового значения выбранной ячейки для свойства value
                //pageVC.value = arrayOfSymbols.firstIndex(of: arrayOfSymbols[indexPath.row])!
            }
        }
    }
}
