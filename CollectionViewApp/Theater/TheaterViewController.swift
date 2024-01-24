//
//  TheaterViewController.swift
//  CollectionViewApp
//
//  Created by 차소민 on 1/15/24.
//

import UIKit
import MapKit
import CoreLocation

class TheaterViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var locationButton: UIButton!
    var theaterList = TheaterList.mapAnnotations {
        didSet {
            mapView.reloadInputViews()
        }
    }
    var theaterType: String = ""
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        all()
        setUI()
        setNavigationBarItem()
        
        locationManager.delegate = self
        checkDeviceLocationAuthorization()
    }
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        checkDeviceLocationAuthorization()
        locationManager.delegate = self

    }
    
}

// 네비게이션, alert 버튼
extension TheaterViewController {
    
    func setNavigationBarItem() {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func rightBarButtonItemClicked() {
        let title = ["전체보기", "CGV", "롯데시네마", "메가박스"]

        showTheaterAlert(actionTitleList: title) { action in
            if action.title == title[0] {
                self.remove()
                self.all()
            } else {
                self.remove()
                self.theaterType = action.title ?? ""
                self.filter()
            }
        }
    }
   
    func setUI() {
        locationButton.setTitle("", for: .normal)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let image = UIImage(systemName: "location.fill", withConfiguration: imageConfig)
        locationButton.setImage(image, for: .normal)
        locationButton.layer.cornerRadius = locationButton.frame.width / 2
        locationButton.backgroundColor = .black
    }
}

// 영화관 필터
extension TheaterViewController {
    func all() {
        theaterList.forEach {
            let coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
            
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 15000, longitudinalMeters: 15000)
            
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = $0.location
            print(annotation)
            mapView.addAnnotation(annotation)
        }
        
    }
    func filter() {
        theaterList.forEach {
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
        mapView.annotations.forEach {
            mapView.removeAnnotation($0)
        }
    }
}

// 위치
extension TheaterViewController {
    func checkDeviceLocationAuthorization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요")
                // toast
            }
        }
    }
    
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            showLocationSettingAlert()
            setRegionAndAnnotation(center: CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463))
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            
//            locationManager.requestLocation()
            

            
            print("++++++++++")
        default:
            print("Error")
        }
    }
    
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let setting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(setting)
            } else {
                print("설정으로 가주세요")
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)
    }
}




extension TheaterViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("--------")
        if let coordinator = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinator)
        }
        
        // stop을 해주지 않으면, 다시 checkDeviceLocationAuthorization()을 하더라도 startUpdatingLocation()가 실행되지 않는다!!
        locationManager.stopUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
    
    //14미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkDeviceLocationAuthorization()
    }
}
