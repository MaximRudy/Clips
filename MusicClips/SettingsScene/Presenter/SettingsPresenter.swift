//
//  SettingsPresenter.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/24/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation
import UIKit

class SettingsPresenter {
    
    private weak var view: SettingsViewProtocol?
    
    private let maxFontSize: Float = 35.0
    private let minFontSize: Float = 10.0
    
    private var fontNames = [String]()
    
    required init(view: SettingsViewProtocol) {
        self.view = view
        UIFont.familyNames.forEach({ familyName in
            let familyFontNames = UIFont.fontNames(forFamilyName: familyName)
            fontNames.append(contentsOf: familyFontNames)
        })
    }
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    
    var getFontNames: [String] {
        return fontNames
    }
    
    func viewDidLoad() {
        guard let fontSize = UserDefaults.standard.value(forKey: UserDefaultsKeys.fontSize.rawValue) as? Float else {
            return
        }
        let value = (fontSize - minFontSize)/(maxFontSize - minFontSize)
        view?.setSliderValue(to: value)
    }
    
    func didPressBackButton() {
        view?.navigateToPreviousScreen()
    }
    
    func didPressFontSizeSlider(newValue: Float) {
        let value = minFontSize + (maxFontSize - minFontSize) * newValue
        UserDefaults.standard.setValue(value, forKey: UserDefaultsKeys.fontSize.rawValue)
        view?.reloadFontsTable()
    }
    
    func didSelectFontName(at index: Int) {
        UserDefaults.standard.setValue(fontNames[index], forKey: UserDefaultsKeys.font.rawValue)
    }
    

}
