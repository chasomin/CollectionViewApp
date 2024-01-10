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
    
//    var radius = ((UIScreen.main.bounds.width - (20 * 3)) / 2) / 2
    
    override func awakeFromNib() {
        super.awakeFromNib()    // ⭐️ 잊지말기
//        cityImageView.layer.cornerRadius =  radius
        
        cityImageView.setImageView()
        
        cityName.setTitleLabel()
        
        cityExplain.setExplainLabel()
        
    }
}
