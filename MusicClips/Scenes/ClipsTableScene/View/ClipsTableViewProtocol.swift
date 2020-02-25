//
//  ClipsTableViewProtocol.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit
import Foundation

protocol ClipsTableViewProtocol: AnyObject {
    func reloadTable()
    func navigate(to screen: UIViewController)
}
