//
//  ClipsDetailPresenterProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol ClipsDetailPresenterProtocol {
    init(view: ClipsDetailViewProtocol, clip: Clip)
    func viewDidLoad()
    func didPressWatchClipButton()
    func didPressBackButton()
}
