//
//  UILabel+Extension.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/10/24.
//

import UIKit

extension UILabel {
    func setTitleLabel() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textAlignment = .center
    }
    
    func setExplainLabel() {
        self.font = .systemFont(ofSize: 13)
        self.textColor = .lightGray
        self.textAlignment = .center
        self.numberOfLines = 0
    }
}
