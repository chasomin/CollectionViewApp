//
//  TravelCollectionViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit



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
 



