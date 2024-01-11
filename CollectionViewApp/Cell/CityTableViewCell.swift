//
//  CityTableViewCell.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    static let id = "CityTableViewCell"
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        
    }
    

    
}



extension CityTableViewCell {
    func designCell() {
        
        TitleLabel.font = .boldSystemFont(ofSize: 15)
        TitleLabel.textAlignment = .left
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0

        gradeLabel.font = .systemFont(ofSize: 11)
        gradeLabel.textColor = .lightGray
        gradeLabel.textAlignment = .left
        
        saveLabel.font = .systemFont(ofSize: 11)
        saveLabel.textColor = .lightGray
        saveLabel.textAlignment = .left
        
        travelImageView.layer.cornerRadius = 10
        travelImageView.contentMode = .scaleAspectFill
        
        likeButton.setTitle("", for: .normal)
        likeButton.tintColor = .white
        likeButton.layer.shadowColor = UIColor(.gray).cgColor
        likeButton.layer.shadowOpacity = 0.5
    }
    

    
    func configureCell(data: Travel) {
        if !data.ad {
            let image = URL(string: data.travel_image!)
            travelImageView.kf.setImage(with: image)
            
            TitleLabel.text = data.title
            
            descriptionLabel.text = data.description
            
            gradeLabel.text = "별점 \(data.grade!)"
            
            let save = data.save?.formatted()
            saveLabel.text = "∙ 저장 \(save!)"
            
            if data.like! {
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    


}
