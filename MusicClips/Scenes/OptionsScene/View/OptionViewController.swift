//
//  OptionsViewController.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/23/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit

protocol OptionViewControllerDelegate: AnyObject {
    
    func didSetConfiguration(config: OptionsConfiguartion)
    
}

class OptionViewController: UIViewController {
    
    open var presenter: OptionsPresenterProtocol?
    open weak var delegate: OptionViewControllerDelegate?

    @IBOutlet weak var filterByLabel: UILabel!
    @IBOutlet weak var sortByLabel: UILabel!
    
    @IBOutlet weak var hasClipLabel: UILabel!
    @IBOutlet weak var ratingIsMoreThanLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var alphabetLabel: UILabel!
    
    @IBOutlet weak var hasClipSwitch: UISwitch!
    @IBOutlet weak var ratingIsMoreThanSwitch: UISwitch!
    @IBOutlet weak var ratingSwitch: UISwitch!
    @IBOutlet weak var alphabetSwitch: UISwitch!
    
    @IBOutlet weak var ratingIsMoreThanTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter?.viewDidLoad()
        ratingIsMoreThanTextField.delegate = self

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        guard let text = ratingIsMoreThanTextField.text, let value = Double(text) else {
            return
        }
        presenter?.didPressBackButton(ratingIsMoreThanValue: value)
    }
    
    @IBAction func hasTrailerSwitchValueChanged(_ sender: UISwitch) {
        presenter?.didSetHasTrailerSwitch(to: sender.isOn)
    }
    
    @IBAction func ratingIsMoreThanSwitchValueChanged(_ sender: UISwitch) {
        presenter?.didSetRatingIsMoreThanSwitch(to: sender.isOn)
    }
    
    @IBAction func ratingSwitchValueChanged(_ sender: UISwitch) {
        presenter?.didSetRatingSwitch(to: sender.isOn)
    }
    
    @IBAction func alphabetSwitchValueChanged(_ sender: UISwitch) {
        presenter?.didSetAlphabetSwitch(to: sender.isOn)
    }

    @IBAction func clearButtonPressed(_ sender: UIButton) {
        presenter?.didPressClearButton()
    }
    
}

extension OptionViewController: OptionsViewProtocol {
    
    func turnOffSortSwitch(of type: SortType) {
        switch type {
        case .rating:
            ratingSwitch.setOn(false, animated: true)
        case .alphabet:
            alphabetSwitch.setOn(false, animated: true)
        }
    }
    
    func navigateToPreviousScreen(with config: OptionsConfiguartion) {
        delegate?.didSetConfiguration(config: config)
        navigationController?.popViewController(animated: true)
    }
    
    func resetAll() {
        hasClipSwitch.setOn(false, animated: true)
        ratingIsMoreThanSwitch.setOn(false, animated: true)
        ratingSwitch.setOn(false, animated: true)
        alphabetSwitch.setOn(false, animated: true)
        ratingIsMoreThanTextField.text = "0.0"
    }
    
    func setup(with initialConfig: OptionsConfiguartion) {
        hasClipSwitch.setOn(initialConfig.hasClipsFilter, animated: false)
        if let value = initialConfig.ratingIsMoreThanValue {
            ratingIsMoreThanSwitch.setOn(true, animated: false)
            ratingIsMoreThanTextField.text = String(value)
        }
        ratingSwitch.setOn(initialConfig.ratingSort, animated: false)
        alphabetSwitch.setOn(initialConfig.alphabetSort, animated: false)
    }
    
}


extension OptionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
