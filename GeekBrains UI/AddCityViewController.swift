//
//  AddCityViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

    let cities = ["London", "New York", "Moscow", "Minsk", "Tokio"]
    var selectedCity: String?
}

extension AddCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
}

extension AddCityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = cities[indexPath.row]
        performSegue(withIdentifier: "AddCityUnwindSegue", sender: self)
    }
}
