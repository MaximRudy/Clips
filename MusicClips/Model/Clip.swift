//
//  Clip.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

class Clip: Decodable {
    
    private var name: String
    private var song: String
    private var time: Double
    private var rating: Double
    private var coverName: String
    private var clipURL: String?
    
    var getName: String {
        return name
    }
    
    var getSong: String {
        return song
    }
    
    var getTime: Double {
        return time
    }
    
    var getRating: Double {
        return rating
    }
    
    var getCoverName: String {
        return coverName
    }
    
    var getClipURL: String? {
        return clipURL
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case song
        case time
        case rating
        case coverName
        case clipURL
    }
    
}
