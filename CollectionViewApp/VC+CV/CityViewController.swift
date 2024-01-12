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
    var segmentNum = 0
    var arr: [City] = []

    @IBOutlet var domesticSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        designSegment()
        xibRegister(collectionView: cityCollectionView)
        configureLayout(collectionView: cityCollectionView)

        setViewController()
    }
    
    


    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        filterCity(item: sender.selectedSegmentIndex)
        cityCollectionView.reloadData()
    }
    
}



extension CityViewController {
    func setViewController() {
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        searchBar.delegate = self
        navigationController?.navigationBar.tintColor = .black
    }
    
    
    func designSegment() {
        domesticSegment.insertSegment(withTitle: "해외", at: 2, animated: true)
        domesticSegment.setTitle("모두", forSegmentAt: 0)
        domesticSegment.setTitle("국내", forSegmentAt: 1)
    }
}


extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate  {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.TravelXIBCollectionViewCell.rawValue, for: indexPath) as! TravelXIBCollectionViewCell
        cell.configureCell(city: cityList[indexPath.item], image: cell.cityImageView, name: cell.cityName, explain: cell.cityExplain)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CityList", bundle: nil)
        

        let vc = sb.instantiateViewController(withIdentifier: CityListViewController.id) as! CityListViewController

        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterCity(item: segmentNum)
        arr = []
        var text = searchText.lowercased()
        
        print(text)
        
        if text != "" {
            cityList.map {
                if $0.city_english_name.lowercased().contains(text) {
                    arr.append($0)
                } else if $0.city_english_name.lowercased().contains(text) {
                    arr.append($0)
                } else if $0.city_explain.lowercased().contains(text) {
                    arr.append($0)
                }
            }
            cityList = arr
            print(cityList)
        } else {
            filterCity(item: segmentNum)
        }
        
        cityCollectionView.reloadData()
    }
    
    
    
    func filterCity(item: Int) {
        switch item {
        case Segment.all.rawValue :
            cityList = CityInfo().city
            segmentNum = 0
        case Segment.domestic.rawValue:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == true
            }
            segmentNum = 1
        case Segment.overseas.rawValue:
            cityList = CityInfo().city.filter{
                $0.domestic_travel == false
            }
            segmentNum = 2
        default:
            break
        }
    }
    

  
}
