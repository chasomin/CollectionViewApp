//
//  TravelCollectionViewCell.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/9/24.
//

import UIKit
import Kingfisher

class TravelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()    // ⭐️ 잊지말기
        cityImageView.setImageView()
        
        cityName.setTitleLabel()
        
        cityExplain.setExplainLabel()
        
    }
   
}


