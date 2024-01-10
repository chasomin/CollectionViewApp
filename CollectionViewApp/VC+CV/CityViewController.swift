//
//  CityViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit

enum Segment: Int {
    case all
    case domestic
    case overseas
}

class CityViewController: UIViewController {
    var cityList = CityInfo().city

    @IBOutlet var domesticSegment: UISegmentedControl!
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        designSegment()
        xibRegister(collectionView: cityCollectionView)
        configureLayout(collectionView: cityCollectionView)

        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self

    }
    
    
    func designSegment() {
        domesticSegment.insertSegment(withTitle: "해외", at: 2, animated: true)
        domesticSegment.setTitle("모두", forSegmentAt: 0)
        domesticSegment.setTitle("국내", forSegmentAt: 1)
    }

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case Segment.all.rawValue :
            cityList = CityInfo().city
        case Segment.domestic.rawValue:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == true
            }
        case Segment.overseas.rawValue:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == false
            }
        default:
            break
        }
        cityCollectionView.reloadData()
    }
    
}


extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource  {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue, for: indexPath) as! TravelXIBCollectionViewCell
        cell.configureCell(city: cityList[indexPath.item], image: cell.cityImageView, name: cell.cityName, explain: cell.cityExplain)
        return cell
    }
  
}
