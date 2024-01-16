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
    var segmentNum = 0
    
    let originalList = CityInfo.city
    
    var cityList = CityInfo.city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    var text = ""

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
        searchBar.text = ""
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
    
    func filterCity(item: Int) {
        switch item {
        case Segment.all.rawValue :
            cityList = originalList
            segmentNum = 0
        case Segment.domestic.rawValue:
            cityList = originalList.filter{
                $0.domestic_travel == true
            }
            segmentNum = 1
        case Segment.overseas.rawValue:
            cityList = originalList.filter{
                $0.domestic_travel == false
            }
            segmentNum = 2
        default:
            break
        }
    }

}

extension CityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filterCity(item: segmentNum)
        
        var filterData: [City] = []
        
        text = searchText.lowercased()
        
        if text.contains(" ") {
            cityList = []
        } else if text != "" {
            switch segmentNum {
            case 0 :
                originalList.forEach {
                    if $0.city_name.lowercased().contains(text) {
                        filterData.append($0)
                    } else if $0.city_english_name.lowercased().contains(text) {
                        filterData.append($0)
                    } else if $0.city_explain.lowercased().contains(text) {
                        filterData.append($0)
                    }
                }
                print(filterData)
                cityList = filterData
                
            case 1 :
                originalList.forEach {
                    if $0.domestic_travel == true {
                        if $0.city_name.lowercased().contains(text) {
                            filterData.append($0)
                        } else if $0.city_english_name.lowercased().contains(text) {
                            filterData.append($0)
                        } else if $0.city_explain.lowercased().contains(text) {
                            filterData.append($0)
                        }
                    }
                }
                cityList = filterData
                segmentNum = 1
            case 2 :
                originalList.forEach {
                    if $0.domestic_travel == false {
                        if $0.city_name.lowercased().contains(text) {
                            filterData.append($0)
                        } else if $0.city_english_name.lowercased().contains(text) {
                            filterData.append($0)
                        } else if $0.city_explain.lowercased().contains(text) {
                            filterData.append($0)
                        }
                    }
                }
                cityList = filterData
            default:
                break
            }
        } else {
            filterCity(item: segmentNum)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    

}


extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: TravelXIBCollectionViewCell.id, for: indexPath) as! TravelXIBCollectionViewCell
        cell.configureCell(city: cityList[indexPath.item], image: cell.cityImageView, name: cell.cityName, explain: cell.cityExplain)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CityList", bundle: nil)
        

        let vc = sb.instantiateViewController(withIdentifier: CityListViewController.id) as! CityListViewController

        
        navigationController?.pushViewController(vc, animated: true)
    }

}
