//
//  TableViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 16/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(forClass: XibTableViewCell.self)
        tableView.register(UINib(nibName: "TableViewHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "TableViewHeader")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forClass: XibTableViewCell.self, for: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader")
        header?.backgroundView = UIView()
        header?.backgroundView?.backgroundColor = .green
        return header
    }
}
