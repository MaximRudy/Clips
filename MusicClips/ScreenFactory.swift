//
//  ScreenFactory.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

import UIKit

class ScreenFactory {
    
    public static func createClipsTableScreen() -> ClipsTableViewController? {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClipsTableViewController") as? ClipsTableViewController else {
            return nil
        }
        let presenter = ClipsTablePresenter(view: controller)
        controller.presenter = presenter
        return controller
    }
    
    public static func createClipsDetailScreen(with clip: Clip) -> ClipsDetailViewController? {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClipsDetailViewController") as? ClipsDetailViewController else {
            return nil
        }
        let presenter = ClipsDetailPresenter(view: controller, clip: clip)
        controller.presenter = presenter
        return controller
    }
    
    public static func createOptionScreen(with config: OptionsConfiguartion?) -> OptionViewController? {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OptionViewController") as? OptionViewController else {
            return nil
        }
        let presenter = OptionsPresenter(view: controller, config: config)
        controller.presenter = presenter
        return controller
    }
    
    public static func createSettingsScreen() -> SettingsViewController? {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
            return nil
        }
        let presenter = SettingsPresenter(view: controller)
        controller.presenter = presenter
        return controller
    }
}
