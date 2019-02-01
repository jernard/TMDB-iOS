//
//  APICLient.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/28/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import AlamofireImage

class APICLient: InteractorToApiClientProtocol {
    var requestHandler: ApiClientToInteractorProtocol?
    var genres: [genre]?
    
    
    
    func fetchList(identificator: String) {
        getGeners()
        
        switch identificator {
        case "popular":
            request(path: APIEnpoints.popular.request, identificator: identificator)
        case "toprated":
            request(path: APIEnpoints.toprated.request, identificator: identificator)
        case "upcoming":
            request(path: APIEnpoints.upcoming.request, identificator: identificator)
        default:
            print("error in APIClient, no able identificator")
        }
        
    }
    
    private func request(path: String, identificator: String){
        Alamofire
            .request(path, method: .get)
            .validate()
            .responseArray(keyPath: "results", completionHandler: { (response: DataResponse<[ListItemModel]>) in
                switch response.result {
                case .success(let list):
                    //print("Success - fetchList - \(path)")
                    //self.requestHandler?.fetchSuccess(listItems: list, identificator: identificator)
                    self.setGenreTitles(list: list, identificator: identificator)
                case .failure( _): break
                    //print("Error - fetchList - \(path)")
                }
            })
    }
    
    private func getGeners() {
        Alamofire
            .request(APIEnpoints.genders.request, method: .get)
            .validate()
            .responseArray(keyPath: "genres", completionHandler: { (response: DataResponse<[genre]>) in
                switch response.result {
                case .success(let list):
                    self.genres = list
                                    case .failure( _):
                    print("Error - getGeners - \(APIEnpoints.genders.request)")
                }
            })
    }
    
    private func setGenreTitles(list: [ListItemModel], identificator: String) {
        let muteableList = list
        for item in muteableList{
            item.gender = {
                var text = ""
                for i in item.genders{
                    for j in self.genres! {
                        if(i == j.id){
                            text.append("\(j.name) ")
                        }
                    }
                }
                return text
            }()
        }
        requestHandler?.fetchSuccess(listItems: muteableList, identificator: identificator)
    }
}
