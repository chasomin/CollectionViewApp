//
//  TheaterViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/15/24.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var theaterList = TheaterList.mapAnnotations {
        didSet {
            mapView.reloadInputViews()
        }
    }
    var theaterType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        all()
        
        setNavigationBarItem()
        
    }
    

}

extension TheaterViewController {
    
    func setNavigationBarItem() {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        
        navigationItem.rightBarButtonItem = button
    }
    
    @objc 
    func rightBarButtonItemClicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let button = UIAlertAction(title: "취소", style: .cancel)
        let buttonAll = UIAlertAction(title: "전체보기", style: .default, handler: { action in
            self.remove()
            self.all()
        })
        let buttonCGV = UIAlertAction(title: "CGV", style: .default, handler: { action in
            self.remove()
            self.theaterType = action.title ?? ""
            self.filter()
        })
        let buttonLotte = UIAlertAction(title: "롯데시네마", style: .default, handler: { action in
            self.remove()
            self.theaterType = action.title ?? ""
            self.filter()
            
        })
        let buttonMega = UIAlertAction(title: "메가박스", style: .default, handler: { action in
            self.remove()
            self.theaterType = action.title ?? ""
            self.filter()
            
        })
        
        alert.addAction(button)
        alert.addAction(buttonMega)
        alert.addAction(buttonLotte)
        alert.addAction(buttonCGV)
        alert.addAction(buttonAll)
        
        present(alert, animated: true)
    }
    
    
    
}


extension TheaterViewController {
    func all() {
        theaterList.map {
            let coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
            
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 15000, longitudinalMeters: 15000)
            
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = $0.location
            
            mapView.addAnnotation(annotation)
        }
        
    }
    func filter() {
        theaterList.map {
            if $0.type == theaterType {
                let coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
                
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 15000, longitudinalMeters: 15000)
                
                mapView.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = $0.location
                
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    
    
    func remove() {
        mapView.annotations.map {
            mapView.removeAnnotation($0)
        }
    }
}
