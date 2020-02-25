//
//  OptionsViewProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/23/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol OptionsViewProtocol: AnyObject {
    
    func navigateToPreviousScreen(with config: OptionsConfiguartion)
    func turnOffSortSwitch(of type: SortType)
    func resetAll()
    func setup(with initialConfig: OptionsConfiguartion)
    
}
