//
//  TravelXIBCollectionViewCell.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit

class TravelXIBCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityExplain: UILabel!
    
    var radius = ((UIScreen.main.bounds.width - (20 * 3)) / 2) / 2
    
    override func awakeFromNib() {
        cityImageView.layer.cornerRadius =  radius
        cityImageView.contentMode = .scaleAspectFill
        
        cityName.font = .boldSystemFont(ofSize: 15)
        cityName.textAlignment = .center
        
        cityExplain.font = .systemFont(ofSize: 13)
        cityExplain.textColor = .lightGray
        cityExplain.textAlignment = .center
        cityExplain.numberOfLines = 0
        
    }
    
    func configureCell(city: City) {
        cityImageView.kf.setImage(with: URL(string: city.city_image))
        
        cityName.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplain.text = city.city_explain
        
    }
   
}
