//
//  OptionsPresenterProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/23/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol OptionsPresenterProtocol {
    
    init(view: OptionsViewProtocol, config: OptionsConfiguartion?)
    func viewDidLoad()
    func didPressBackButton(ratingIsMoreThanValue: Double)
    func didSetHasTrailerSwitch(to value: Bool)
    func didSetRatingIsMoreThanSwitch(to value: Bool)
    func didSetRatingSwitch(to value: Bool)
    func didSetAlphabetSwitch(to value: Bool)
    func didPressClearButton()
    
}
