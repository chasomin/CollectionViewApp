//
//  TravelCollectionViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit

protocol UIConfigure {
    func configureLayout()
}

protocol Xib {
    func xibRegister()
}

enum Identifier: String {
    case TravelCollectionViewCell
    case TravelXIBCollectionViewCell
}

class TravelCollectionViewController: UICollectionViewController {

    let cityList = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xibRegister()
        configureLayout()

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue, for: indexPath) as! TravelXIBCollectionViewCell
        
        cell.configureCell(city: cityList[indexPath.item])
        
        return cell
    }

}
 


extension UICollectionViewController: UIConfigure, Xib {
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width/2, height: width/2 + 70)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        collectionView.collectionViewLayout = layout
    }
    
    func xibRegister() {
        let xib = UINib(nibName: Identifier.TravelXIBCollectionViewCell.rawValue, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue)
    }
}
