//
//  UILabel+Extension.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/25/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setUserFontConfig() {
        let fontSize = UserDefaults.standard.value(forKey: UserDefaultsKeys.fontSize.rawValue) as? Float ?? Float(17)
        if let fontName = UserDefaults.standard.value(forKey: UserDefaultsKeys.font.rawValue) as? String {
            font = UIFont(name: fontName, size: CGFloat(fontSize))
        } else {
            font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        }
    }
    
}
