//
//  UIViewController+Extension.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/24/24.
//

import UIKit

extension UIViewController {
    func showTheaterAlert(actionTitleList: [String], completionHandler: @escaping (_ action: UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let button = UIAlertAction(title: "취소", style: .cancel)
        
        let button0 = UIAlertAction(title: actionTitleList[0], style: .default, handler: { action in
            completionHandler(action)
        })
        
        let button1 = UIAlertAction(title: actionTitleList[1], style: .default, handler: { action in
            completionHandler(action)
        })
        
        let button2 = UIAlertAction(title: actionTitleList[2], style: .default, handler: { action in
            completionHandler(action)

        })
        
        let button3 = UIAlertAction(title: actionTitleList[3], style: .default, handler: { action in
            completionHandler(action)

        })
        
        alert.addAction(button0)
        alert.addAction(button1)
        alert.addAction(button2)
        alert.addAction(button3)
        alert.addAction(button)
        
        present(alert, animated: true)
    }
}
