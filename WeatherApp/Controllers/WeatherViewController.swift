//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 19.09.2024.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private let primaryView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        //getLocation()
    }
    
    func getLocation(){
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                
                DispatchQueue.main.async {
                    self?.primaryView.reload()
                }
                

            }
        }
    }
    private func setUpView(){
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        primaryView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
    

}
