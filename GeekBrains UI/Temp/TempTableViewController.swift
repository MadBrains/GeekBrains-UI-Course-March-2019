//
//  TempTableViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 30/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TempTableViewController: UITableViewController {

    var friends = ["Вася", "Антон", "Миша", "Алексей", "Владимир Владимирович"]
    var mappedFriends: [String: [String]]!
    
    var sortedLetters: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TempHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        
        updateData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return mappedFriends.keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sortedLetters[section]
        let friendsOnLetter = mappedFriends[letter]!
        return friendsOnLetter.count * 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let letter = sortedLetters[indexPath.section]
            let friendsOnLetter = mappedFriends[letter]!
            cell.textLabel?.text = friendsOnLetter[indexPath.row / 2]
            return cell
        }
        else {
            return tableView.dequeueReusableCell(withIdentifier: "likesCell", for: indexPath)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! TempHeader
        let letter = sortedLetters[section]
        header.label.text = letter
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let letter = sortedLetters[indexPath.section]
        let friendsOnLetter = mappedFriends[letter]!
        let friend = friendsOnLetter[indexPath.row]
        friends.append(friend)
        updateData()
    }
    
    func updateData() {
        var mappedFriends = [String: [String]]()
        
        for friend in friends {
            let firstLetter = String(friend.first!)
            var arrayOnLetter = mappedFriends[firstLetter] ?? []
            arrayOnLetter.append(friend)
            mappedFriends[firstLetter] = arrayOnLetter
        }
        
        self.mappedFriends = mappedFriends
        sortedLetters = mappedFriends.keys.sorted()
        
        tableView.reloadData()
    }

}
