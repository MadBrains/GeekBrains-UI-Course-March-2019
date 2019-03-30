//
//  CityViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

struct Friend {
    let name: String
    var likeCount: Int
}

class CityWeatherViewController: UIViewController {

    var arrFriends = [Friend(name: "Пупкин", likeCount: 2), Friend(name: "Кузьма", likeCount: 5)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CityWeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFriends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forClass: CityWeatherCell.self, for: indexPath)
        let friend = arrFriends[indexPath.row]
        
        cell.weatherLabel.text = friend.name
        cell.likesView.likesCount = friend.likeCount
        
        cell.likesView.onTap = {
            let newFriend = Friend(name: friend.name, likeCount: friend.likeCount + 1)
            self.arrFriends[indexPath.row] = newFriend
            collectionView.reloadData()
        }
        
        return cell
    }
}

extension CityWeatherViewController: UICollectionViewDelegate {
    
}
