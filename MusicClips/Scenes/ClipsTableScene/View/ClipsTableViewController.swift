//
//  ClipsTableViewController.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit

class ClipsTableViewController: UIViewController {
    
    open var presenter: ClipsTablePresenterProtocol?

    @IBOutlet weak var clipsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clipsTableView.delegate = self
        clipsTableView.dataSource = self
        clipsTableView.estimatedRowHeight = 110

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clipsTableView.reloadData()
    }
    
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        presenter?.didPressOptionsButton()
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        presenter?.didPressSettingsButton()
    }
    
}

extension ClipsTableViewController: ClipsTableViewProtocol {
    
    func reloadTable() {
        clipsTableView.reloadData()
    }
    
    func navigate(to screen: UIViewController) {
        navigationController?.pushViewController(screen, animated: true)
    }
    
}

extension ClipsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getClips.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClipsTableViewCell",
                                                       for: indexPath) as? ClipsTableViewCell else {
            fatalError("Table couldn't dequeue reusable cell")
        }
        
        if let clip = presenter?.getClips[indexPath.row] {
            cell.configure(with: clip)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let clip = presenter?.getClips[indexPath.row] else {
            return
        }
        presenter?.didSelect(clip: clip)
    }
    
}
