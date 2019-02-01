//
//  ListItemModel.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ListItemModel: Mappable {
    var id: Int = 0
    var title = ""
    var rate: Float = 0.0
    var image = ""
    var video: Bool = false
    var clasification: Bool?
    var genders:[Int] = []
    var gender: String?
    var overview = ""
    var date = ""
    var backdrop = ""
    
    required init?(map: Map) { }
    
    func mapping(map:Map){
        id <- map["id"]
        title <- map["title"]
        rate <- map["vote_average"]
        image <- map["poster_path"]
        video <- map["video"]
        clasification <- map["adult"]
        genders <- map["genre_ids"]
        overview <- map["overview"]
        date <- map["release_date"]
        backdrop <- map["backdrop_path"]
    }
    
}
