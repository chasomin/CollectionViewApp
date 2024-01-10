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
        xibRegister()
        configureLayout()

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


extension CityViewController: Xib, UIConfigure, UICollectionViewDelegate, UICollectionViewDataSource  {
    func xibRegister() {
        let xib = UINib(nibName: Identifier.TravelXIBCollectionViewCell.rawValue, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue)
    }
    
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width/2, height: width/2 + 70)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        cityCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue, for: indexPath) as! TravelXIBCollectionViewCell
        cell.configureCell(city: cityList[indexPath.item])
        return cell
    }
  
}
