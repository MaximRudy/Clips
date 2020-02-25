//
//  SettingsViewProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/25/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol SettingsViewProtocol: AnyObject {

    func navigateToPreviousScreen()
    func reloadFontsTable()
    func setSliderValue(to value: Float)
    
}
