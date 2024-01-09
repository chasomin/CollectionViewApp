//
//  CityViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit


class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var cityList = CityInfo().city

    @IBOutlet var domesticSegment: UISegmentedControl!
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        designSegment()

        
        let xib = UINib(nibName: Identifier.TravelXIBCollectionViewCell.rawValue, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue)
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width/2, height: width/2 + 70)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        cityCollectionView.collectionViewLayout = layout
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue, for: indexPath) as! TravelXIBCollectionViewCell
        cell.configureCell(city: cityList[indexPath.item])
        return cell
    }
    
    
    
    func designSegment() {
        domesticSegment.insertSegment(withTitle: "해외", at: 2, animated: true)
        domesticSegment.setTitle("모두", forSegmentAt: 0)
        domesticSegment.setTitle("국내", forSegmentAt: 1)
    }

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            cityList = CityInfo().city
        case 1:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == true
            }
        case 2:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == false
            }
        default:
            break
        }
        cityCollectionView.reloadData()
    }

    
}
