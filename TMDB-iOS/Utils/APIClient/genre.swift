//
//  genre.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/30/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

struct genre {
    var id: Int = 0
    var name = ""
}

extension genre: Mappable {
    init?(map:Map) {
        
    }
    
    mutating func mapping(map:Map){
        id <- map["id"]
        name <- map["name"]
    }
}
