//
//  ADTableViewCell.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let id = "ADTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var ADLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
    


}


extension ADTableViewCell {
    func designCell() {
        layer.cornerRadius = 10
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        ADLabel.layer.cornerRadius = 10
        ADLabel.clipsToBounds = true
        ADLabel.backgroundColor = .white
        ADLabel.text = "AD"
        ADLabel.textColor = .black
        ADLabel.textAlignment = .center
        ADLabel.font = .systemFont(ofSize: 15)
        
        self.backgroundColor = UIColor(cgColor: CGColor(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1))
        
    }
    
    
    
    func configureCell(data: Travel) {
        if data.ad {
            titleLabel.text = data.title
        }
    }
}
