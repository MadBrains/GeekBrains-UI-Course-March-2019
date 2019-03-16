//
//  UITableViewExtension.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib(forClass neededClass: AnyClass) {
        register(UINib(nibName: String(describing: neededClass), bundle: Bundle.main), forCellReuseIdentifier: String(describing: neededClass))
    }
    
    func registerCell(forClass neededClass: AnyClass) {
        register(neededClass, forCellReuseIdentifier: String(describing: neededClass))
    }
    
    public func register(nib: UINib?, forHeaderFooterViewClass neededClass: AnyClass) {
        register(neededClass, forHeaderFooterViewReuseIdentifier: String(describing: neededClass))
    }
    
    public func register(forHeaderFooterViewClass neededClass: AnyClass) {
        register(neededClass, forHeaderFooterViewReuseIdentifier: String(describing: neededClass))
    }
    
    func dequeueReusableCell<T: UITableViewCell> (forClass neededClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: neededClass), for: indexPath) as! T
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(forClass neededClass: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: neededClass)) as! T
    }
}
