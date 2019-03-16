//
//  AddCityViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {
    
    var addCity: ((String) -> Void)?

    let cities = ["London", "New York", "Moscow", "Minsk", "Tokio"]
    var selectedCity: String?
}

extension AddCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forClass: AddCityCell.self, for: indexPath)
        cell.cityLabel?.text = cities[indexPath.row]
        
        cell.addCityTaped = { cityName in
            self.addCity?(cityName)
        }
        
        return cell
    }
    
}
