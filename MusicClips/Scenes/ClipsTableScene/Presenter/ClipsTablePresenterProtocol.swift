//
//  ClipsTablePresenterProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol ClipsTablePresenterProtocol {
    
    init(view: ClipsTableViewProtocol)
    var getClips: [Clip] { get }
    func didSelect(clip: Clip)
    func didPressOptionsButton()
    func didPressSettingsButton()
    
}
