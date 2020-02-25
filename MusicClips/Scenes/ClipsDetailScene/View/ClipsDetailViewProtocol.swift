//
//  ClipsDetailViewProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

protocol ClipsDetailViewProtocol: AnyObject {
    func configure(with clip: Clip)
    func playClip(by url: URL)
    func showNoClipMessage()
    func navigateToPreviousScreen()
}
