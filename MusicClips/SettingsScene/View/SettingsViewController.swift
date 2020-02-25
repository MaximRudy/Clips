//
//  SettingsViewController.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/24/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    open var presenter: SettingsPresenterProtocol?
    
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var fontsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontsTableView.delegate = self
        fontsTableView.dataSource = self
        fontsTableView.estimatedRowHeight = 43
        presenter?.viewDidLoad()
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        presenter?.didPressBackButton()
    }
    
    @IBAction func fontSizeSliderPressed(_ sender: UISlider) {
        presenter?.didPressFontSizeSlider(newValue: sender.value)
    }
    
    @IBAction func languageControlValueChanged(_ sender: UISegmentedControl) {
    }
    
}

extension SettingsViewController: SettingsViewProtocol {
    
    func navigateToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    func reloadFontsTable() {
        fontsTableView.reloadData()
    }
    
    func setSliderValue(to value: Float) {
        fontSizeSlider.setValue(value, animated: false)
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getFontNames.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FontTableViewCell", for: indexPath) as? FontTableViewCell else {
            fatalError("Table couldn't dequeue cell of type FontTableViewCell")
        }
        
        if let fontName = presenter?.getFontNames[indexPath.row] {
            cell.fontNameLabel.text = fontName
            cell.fontNameLabel.font = UIFont(name: fontName,
                                             size: UserDefaults.standard.value(forKey:
                                                UserDefaultsKeys.fontSize.rawValue) as? CGFloat ?? 17)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectFontName(at: indexPath.row)
    }
    
}
