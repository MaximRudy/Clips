//
//  ClipsDetailViewController.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/22/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit
import AVKit

class ClipsDetailViewController: UIViewController {
    
    open var presenter: ClipsDetailPresenterProtocol?
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var watchClipButton: UIButton!
    @IBOutlet weak var songLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func watchClipButtonPressed(_ sender: UIButton) {
        presenter?.didPressWatchClipButton()
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        presenter?.didPressBackButton()
    }
}

extension ClipsDetailViewController: ClipsDetailViewProtocol {
    
    func configure(with clip: Clip) {
        if let image = UIImage(named: clip.getCoverName) {
            coverImageView.image = image
        }
        
        nameLabel.text = clip.getName
        timeLabel.text = String(clip.getTime) + " minutes"
        ratingLabel.text = String(clip.getRating) + " 🤍"
        songLabel.text = clip.getSong
    }
    
    func playClip(by url: URL) {
        let player = AVPlayer(url: url)

        let vc = AVPlayerViewController()
        vc.player = player

        self.present(vc, animated: true) { vc.player?.play() }
    }
    
    func showNoClipMessage() {
        let alert = UIAlertController(title: "No clip found", message: "Sorry, we couldn't find clip for this song", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
