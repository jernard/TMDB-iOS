//
//  APIEndpoint.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/29/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Alamofire

struct APIConstants{
    static let base_url:String = "https://api.themoviedb.org/3/"
    static let base_image_url:String = "https://image.tmdb.org/t/p/w500"
    static let api_key:String = "753fa3ed09b206e4a6f849f59236cf5b"
    static let default_language:String = "en-US"
}


enum APIEnpoints {
    
    case popular
    case toprated
    case upcoming
    case genders
    
    private var method: HTTPMethod {
        switch self {
        case .popular, .toprated, .upcoming:
            return .get
        default:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .toprated:
            return "movie/top_rated"
        case .upcoming:
            return "movie/upcoming"
        case .genders:
            return "genre/movie/list"
        }
    }
    
    private var key: String {
        switch self {
        case .popular, .toprated, .upcoming, .genders:
            return "api_key=\(APIConstants.api_key)"
        default:
            return ""
        }
    }
    
    private var language: String {
        switch self {
        case .popular, .toprated, .upcoming, .genders:
            return "language=\(APIConstants.default_language)"
        default:
            return ""
        }
    }
    
    public var request: String {
        switch self {
        case .popular, .toprated, .upcoming, .genders:
            return "\(APIConstants.base_url)\(path)?\(key)&\(language)"
                }
    }
    
}
