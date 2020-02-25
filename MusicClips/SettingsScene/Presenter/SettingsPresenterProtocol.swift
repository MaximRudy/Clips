//
//  SettingsPresenterProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/24/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol SettingsPresenterProtocol {
    
    init(view: SettingsViewProtocol)
    var getFontNames: [String] { get }
    func viewDidLoad()
    func didPressBackButton()
    func didPressFontSizeSlider(newValue: Float)
    func didSelectFontName(at index: Int)
    
}

