//
//  CityListViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/11/24.
//

import UIKit

class CityListViewController: UIViewController {

    static let id = "CityListViewController"
    
    var travel = TravelInfo().travel
    
    
    @IBOutlet var cityListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()

    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        travel[sender.tag].like?.toggle()       
        cityListTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)

    }

}




extension CityListViewController {
    
    func setTableView() {
        navigationItem.title = "도시 상세 정보"

        cityListTableView.delegate = self
        cityListTableView.dataSource = self
        
        let xibCity = UINib(nibName: CityTableViewCell.id, bundle: nil)
        cityListTableView.register(xibCity, forCellReuseIdentifier: CityTableViewCell.id)

        let xibAD = UINib(nibName: ADTableViewCell.id, bundle: nil)
        cityListTableView.register(xibAD, forCellReuseIdentifier: ADTableViewCell.id)

    }
    
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if travel[indexPath.item].ad {
            let cell = cityListTableView.dequeueReusableCell(withIdentifier: ADTableViewCell.id, for: indexPath) as! ADTableViewCell
            cell.configureCell(data: travel[indexPath.item])
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = cityListTableView.dequeueReusableCell(withIdentifier: CityTableViewCell.id, for: indexPath) as! CityTableViewCell
            
            cell.likeButton.tag = indexPath.item
            cell.configureCell(data: travel[indexPath.item])
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

            cell.selectionStyle = .none
            
            return cell
        }
        
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travel[indexPath.item].ad {
            return 80
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travel[indexPath.item].ad {
            print(#function)
            let sb = UIStoryboard(name: "AD", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: ADViewController.id) as! ADViewController
            
            let nav = UINavigationController(rootViewController: vc)

            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
            

        } else {
            let sb = UIStoryboard(name: "CityDetail", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: CityDetailViewController.id) as! CityDetailViewController
            
           
            navigationController?.pushViewController(vc, animated: true)

            
        }
    }
    
    
}
