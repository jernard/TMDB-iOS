//
//  DetailPresenter.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/26/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol{
    var view: DetailPresenterToViewProtocol?
    
    var router: DetailPresenterToRouterProtocol?
    
    var item: ListItemModel?
    
    func viewDidLoad() {
        view?.showDetail(item: item!)
    }
    
    
}
