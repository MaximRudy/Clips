//
//  OptionsPresenter.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/23/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

class OptionsPresenter {
    
    private weak var view: OptionsViewProtocol?
    
    private var hasClipsFilter: Bool = false
    private var ratingIsMoreThanFilter: Bool = false
    
    private var ratingSort: Bool = false {
        didSet {
            if ratingSort {
                alphabetSort = false
                view?.turnOffSortSwitch(of: .alphabet)
            }
        }
    }

    private var alphabetSort: Bool = false {
        didSet {
            if alphabetSort {
                ratingSort = false
                view?.turnOffSortSwitch(of: .rating)
            }
        }
    }
    private var initialConfiguration: OptionsConfiguartion?
    
    required init(view: OptionsViewProtocol, config: OptionsConfiguartion?) {
        self.view = view
        self.initialConfiguration = config
    }
        
}

extension OptionsPresenter: OptionsPresenterProtocol {
    
    func didPressBackButton(ratingIsMoreThanValue: Double) {
        
        let value = ratingIsMoreThanFilter ? ratingIsMoreThanValue : nil
        let config = OptionsConfiguartion(hasClipsFilter: hasClipsFilter,
                                          ratingIsMoreThanValue: value,
                                          ratingSort: ratingSort,
                                          alphabetSort: alphabetSort)
        view?.navigateToPreviousScreen(with: config)
    }
    
    func  viewDidLoad() {
        if let config = self.initialConfiguration {
            hasClipsFilter = config.hasClipsFilter
            ratingIsMoreThanFilter = config.ratingIsMoreThanValue != nil
            ratingSort = config.ratingSort
            alphabetSort = config.alphabetSort
            view?.setup(with: config)
        }
    }
    
    func didSetHasTrailerSwitch(to value: Bool) {
        hasClipsFilter = value
    }
    
    func didSetRatingIsMoreThanSwitch(to value: Bool) {
        ratingIsMoreThanFilter = value
    }
    
    func didSetRatingSwitch(to value: Bool) {
        ratingSort = value
    }
    
    func didSetAlphabetSwitch(to value: Bool) {
        alphabetSort = value
    }
    
    func didPressClearButton() {
        hasClipsFilter = false
        ratingIsMoreThanFilter = false
        ratingSort = false
        alphabetSort = false
        view?.resetAll()
    }
    
}

