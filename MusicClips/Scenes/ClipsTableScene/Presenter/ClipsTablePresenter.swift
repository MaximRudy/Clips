//
//  ClipsTablePresenter.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

class ClipsTablePresenter {
    
    weak var view: ClipsTableViewProtocol?
    private var clips: [Clip] = ClipsService.shared.getClips()
    private var optionsConfiguraion: OptionsConfiguartion?
    
    required init(view: ClipsTableViewProtocol) {
        self.view = view
    }
}

extension ClipsTablePresenter: ClipsTablePresenterProtocol {
    
    var getClips: [Clip] {
        
        guard let config = self.optionsConfiguraion else {
            return clips
        }
        var result: [Clip] = clips
        if config.hasClipsFilter {
            result = result.filter({ $0.getClipURL != nil })
        }
        
        if let value = config.ratingIsMoreThanValue {
            result = result.filter({ $0.getRating > value })
        }
        
        if config.ratingSort {
            return result.sorted(by: { $0.getRating > $1.getRating })
        }
        
        if config.alphabetSort {
            return result.sorted(by: { $0.getName < $1.getName })
        }
        
        var clipsToShow: [Clip] {
            return clips
        }
            
        return result
    }
    
    func didSelect(clip: Clip) {
        guard let screen = ScreenFactory.createClipsDetailScreen(with: clip) else {
            return
        }
        view?.navigate(to: screen)
    }
    
    func didPressOptionsButton() {
        guard let screen = ScreenFactory.createOptionScreen(with: optionsConfiguraion) else {
            return
        }
        screen.delegate = self
        view?.navigate(to: screen)
    }
    
    func didPressSettingsButton() {
        guard let screen = ScreenFactory.createSettingsScreen() else {
            return
        }
        view?.navigate(to: screen)
    }
}

extension ClipsTablePresenter: OptionViewControllerDelegate {
    
    func didSetConfiguration(config: OptionsConfiguartion) {
        optionsConfiguraion = config
        view?.reloadTable()
    }
    
}
