//
//  UIImageView+Extension.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/10/24.
//

import UIKit

extension UIImageView {
    func setImageView() {
        // 시점 늦추기
        // 뷰를 메인쓰레드가 그리고 있는데 이부분을 메인쓰레드로 보내버리니까 맨 뒤 순서로 가게 됨
        // 비동기로 한 이유는?
        // 동기로 처리하면 메인스레드로 보내고 이 일을 다 할 때까지 기다리게 되는데 같은 스레드 맨 뒤로 갔기 때문에 일을 안함 -> 뷰 못그림 -> 오류
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width / 2
        }
        self.contentMode = .scaleAspectFill
    }
}
