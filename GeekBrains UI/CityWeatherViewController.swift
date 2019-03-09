//
//  CityViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class CityWeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CityWeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forClass: CityWeatherCell.self, for: indexPath)
        cell.weatherLabel.text = "541 F"
        cell.timeLabel.text = "1984"
        return cell
    }
}

extension CityWeatherViewController: UICollectionViewDelegate {
    
}
