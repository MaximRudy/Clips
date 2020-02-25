//
//  ClipsService.swift
//  MusicClips
//
//  Created by Максим Рудый on 2/18/20.
//  Copyright © 2020 Maxim Rudy. All rights reserved.
//

import Foundation

class ClipsService {
    
    static let shared = ClipsService()
    
    private init() {}
    
    open func getClips() -> [Clip] {
        guard let path = Bundle.main.path(forResource: "clips", ofType: "json"),
            let data = FileManager.default.contents(atPath: path) else {
            return []
        }
        do {
            let clips = try JSONDecoder().decode([Clip].self, from: data)
            return clips
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}
