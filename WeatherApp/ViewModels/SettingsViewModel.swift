//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Mert Yılmaz on 19.09.2024.
//

import Foundation

struct SettingsViewModel {
    let option: [SettingsOption]
}

enum SettingsOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            return "Upgrade to Pro"
        case .privacyPolicy:
            return "Privacy Policy"
        case .terms:
            return "Terms of Use"
        case .contact:
            return "Contact Us"
        case .getHelp:
            return "Get Help"
        case .rateApp:
            return "Rate App!"
        }
    }
}
