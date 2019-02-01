//
//  DetailProtocols.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/26/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import UIKit

protocol DetailPresenterToViewProtocol: class{
    var presenter: DetailPresenterProtocol? {get set}
    
    func showDetail(item: ListItemModel)
}

protocol DetailPresenterToRouterProtocol: class{
    static func createDetailModule(item: ListItemModel) -> UIViewController
}


protocol DetailPresenterProtocol: class {
    var view: DetailPresenterToViewProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    var item: ListItemModel? {get set}
    
    func viewDidLoad()
    
}
