//
//  ClipsTableViewCell.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/17/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import UIKit

class ClipsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
    }
    
    
    func configure(with clip: Clip) {
        if let image = UIImage(named: clip.getCoverName) {
            coverImageView.image = image
        }
        nameLabel.text = clip.getName
        songLabel.text = clip.getSong
        timeLabel.text = String(clip.getTime) + " minutes"
        ratingLabel.text = String(clip.getRating)
        
    }


}
