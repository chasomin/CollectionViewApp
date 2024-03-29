//
//  TravelCollectionViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit




class TravelCollectionViewController: UICollectionViewController {

    let cityList = CityInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xibRegister(collectionView: collectionView)
        configureLayout(collectionView: collectionView)

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelXIBCollectionViewCell.id, for: indexPath) as! TravelXIBCollectionViewCell
        
        cell.configureCell(city: cityList[indexPath.row], image: cell.cityImageView, name: cell.cityName, explain: cell.cityExplain)
        
        return cell
    }

}
 



