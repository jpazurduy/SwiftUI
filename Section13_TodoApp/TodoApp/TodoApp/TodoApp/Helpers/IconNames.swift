//
//  IconNames.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/13/23.
//

import Foundation
import UIKit

class IconNames: ObservableObject {
    var iconNames: [String?] = []
    
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName {
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    func getAlternateIconNames() {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
           let alteranteIcons  = icons["CFBundleAlternateIcons"] as? [String : Any] {
            for (key, value) in alteranteIcons {
                guard let iconList = value as? Dictionary<String, Any> else { return }
                guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
                guard let icon = iconList.first else { return }
                
                let iconString = key
                iconNames.append(iconString)
            }
        }
    }
}
