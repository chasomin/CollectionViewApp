//
//  UICollectionView+Extension.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/10/24.
//

import UIKit

extension UICollectionViewCell: Identifier {
    static var id: String {
        return String(describing: self)
    }
    
    func configureCell(city: City, image: UIImageView, name: UILabel, explain: UILabel) {
        image.kf.setImage(with: URL(string: city.city_image))
        name.text = city.name
        explain.text = city.city_explain
    }
    

}

