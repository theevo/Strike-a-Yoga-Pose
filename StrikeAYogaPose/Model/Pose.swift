//
//  Pose.swift
//  StrikeAYogaPose
//
//  Created by theevo on 3/11/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import Foundation

struct Pose: Codable {
    let id: Int
    let sanskritName: String
    let englishName: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey{
        case id
        case sanskritName = "sanskrit_name"
        case englishName = "english_name"
        case imageURL = "img_url"
        
    }
}
