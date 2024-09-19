//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 19.09.2024.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getLocation()
    }
    
    func getLocation(){
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
        }
    }

}
