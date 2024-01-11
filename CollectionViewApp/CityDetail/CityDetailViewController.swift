//
//  CityDetailViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    static let id = "CityDetailViewController"

    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "관광지 화면"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        navigationItem.title = "관광지 화면"

    }
    



}
