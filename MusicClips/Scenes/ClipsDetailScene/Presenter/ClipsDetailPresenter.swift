//
//  ClipsDetailPresenter.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

class ClipsDetailPresenter {
    
    private weak var view: ClipsDetailViewProtocol?
    private unowned var clip: Clip
    
    required init(view: ClipsDetailViewProtocol, clip: Clip) {
        self.view = view
        self.clip = clip
    }
    
}

extension ClipsDetailPresenter: ClipsDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.configure(with: clip)
    }
    
    func didPressWatchClipButton() {
        guard let stringURL = clip.getClipURL,
            let path = Bundle.main.path(forResource: NSString(string: stringURL).deletingPathExtension,
                                        ofType: NSString(string: stringURL).pathExtension) else {
            view?.showNoClipMessage()
            return
        }
        let url = URL(fileURLWithPath: path)
        view?.playClip(by: url)
    }
    
    func didPressBackButton() {
        view?.navigateToPreviousScreen()
    }
    
}
