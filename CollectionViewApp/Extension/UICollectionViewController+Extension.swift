//
//  UICollectionViewController+Extension.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/10/24.
//

import UIKit


protocol UIConfigure: UIViewController {
    func configureLayout(collectionView: UICollectionView)
    
}

protocol Xib {
    func xibRegister(collectionView: UICollectionView)
}


extension UIViewController: UIConfigure, Xib {
    func configureLayout(collectionView: UICollectionView) {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width/2, height: width/2 + 70)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        collectionView.collectionViewLayout = layout
    }
    
    func xibRegister(collectionView: UICollectionView) {
        let xib = UINib(nibName: Identifier.TravelXIBCollectionViewCell.rawValue, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue)
    }
}
