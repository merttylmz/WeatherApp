//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 15.09.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabBar()
    }
    
    private func createTabBar(){
        let weatherTab = UINavigationController(rootViewController: WeatherViewController())
        let settingTab = UINavigationController(rootViewController: SettingsViewController())
        
        weatherTab.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun.rain"), tag: 1)
        settingTab.tabBarItem = UITabBarItem(title: "Settings",image: UIImage(systemName: "gear"),tag: 2)
        
        setViewControllers([weatherTab, settingTab], animated: true)
    }
    
}

