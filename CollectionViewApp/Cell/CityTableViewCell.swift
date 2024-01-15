//
//  CityTableViewCell.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var starOne: UIImageView!
    @IBOutlet var starTwo: UIImageView!
    @IBOutlet var starThree: UIImageView!
    @IBOutlet var starFour: UIImageView!
    @IBOutlet var starFive: UIImageView!
    
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
        selectionStyle = .none
        
        TitleLabel.font = .boldSystemFont(ofSize: 15)
        TitleLabel.textAlignment = .left
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0

        starOne.tintColor = .orange
        starTwo.tintColor = .orange
        starThree.tintColor = .orange
        starFour.tintColor = .orange
        starFive.tintColor = .orange

//        gradeLabel.font = .systemFont(ofSize: 11)
//        gradeLabel.textColor = .lightGray
//        gradeLabel.textAlignment = .left
        
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
            
//            gradeLabel.text = "별점 \(data.grade!)"
            setStar(data: data)
            starOne.image = UIImage(systemName: "star.fill")
            let save = data.save?.formatted()
            saveLabel.text = "∙ 저장 \(save!)"
            
            if data.like! {
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    func setStar(data: Travel) {
        switch data.grade! {
            
        case 0...1 :
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star")
            starThree.image = UIImage(systemName: "star")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        case 1...2 :
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")

        case 2...3:
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        case 3...4 :
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.fill")
            starFive.image = UIImage(systemName: "star")
        case 4...5 :
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.fill")
            starFive.image = UIImage(systemName: "star.fill")
        default:
            break
            
            
        }
    }

}
