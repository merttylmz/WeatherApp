//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 19.09.2024.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    private let primaryView: SettingsView = {
        let view = SettingsView()
        let viewModel = SettingsViewModel(option: SettingsOption.allCases)
        view.configure(with: viewModel)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        setUpView()
        
    }
    

    private func setUpView(){
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        primaryView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }


}
extension SettingsViewController: SettingsViewDelegate {
    
    func settingsView(_ settingsView: SettingsView, didTap option: SettingsOption) {
        switch option {
        case .upgrade:
            print("tapped")
        case .privacyPolicy:
            print("tapped")
        case .terms:
            print("tapped")
        case .contact:
            print("tapped")
        case .getHelp:
            print("tapped")
        case .rateApp:
            print("tapped")
        }
    }
    
    
}
