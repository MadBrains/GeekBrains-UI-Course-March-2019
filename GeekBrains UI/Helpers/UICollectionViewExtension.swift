//
//  UICollectionViewExtension.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNib(forClass neededClass: AnyClass) {
        register(UINib(nibName: String(describing: neededClass), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: neededClass))
    }
    
    func registerCell(forClass neededClass: AnyClass) {
        register(neededClass, forCellWithReuseIdentifier: String(describing: neededClass))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> (forClass neededClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: neededClass), for: indexPath) as! T
    }
    
}
