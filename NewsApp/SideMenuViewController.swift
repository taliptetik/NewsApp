//
//  CountriesListController.swift
//  NewsApp
//
//  Created by Talip on 15.03.2023.
//

import Foundation
import UIKit

class SideMenuViewController: UITableViewController {
    
    var titleSelection = [TitleSelection]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideMenuCell")
        
        titleSelection.append(TitleSelection.init(headingOfName: "Countries", headingOfSubtitle: ["Türkiye", "United States", "Great Britain", "France", "Germany", "Italy", "Russia", "Ukraine", "Japan"]))
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titleSelection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleSelection[section].headingOfSubtitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.textLabel?.text = titleSelection[indexPath.section].headingOfSubtitle[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleSelection[section].headingOfName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let targetVC = storyBoard.instantiateViewController(withIdentifier: "newsViewID") as! NewsViewController
        
            if indexPath.row == 0 {
                targetVC.countryCod = "tr"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 1 {
                targetVC.countryCod = "us"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 2 {
                targetVC.countryCod = "gb"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 3 {
                targetVC.countryCod = "fr"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 4 {
                targetVC.countryCod = "de"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 5 {
                targetVC.countryCod = "it"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 6 {
                targetVC.countryCod = "ru"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 7 {
                targetVC.countryCod = "ua"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
                
            } else if indexPath.row == 8 {
                targetVC.countryCod = "jp"
                self.navigationController?.pushViewController(targetVC, animated: true)
                self.dismiss(animated: false, completion: nil)
            }
    	
    }
    
    
}

