//
//  ADViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class ADViewController: UIViewController {

    static let id = "ADViewController"
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "광고 화면"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        navigationItem.title = "광고 화면"
        setBarButtonItem()
    }
    
    func setBarButtonItem() {
        let leftImage = UIImage(systemName: "xmark")
        let leftButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftBarButtonItemClicked() {
        dismiss(animated: true)
    }


}
