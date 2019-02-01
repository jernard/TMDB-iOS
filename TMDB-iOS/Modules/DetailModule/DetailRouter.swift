//
//  DetailRouter.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/26/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    
    
    static func createDetailModule(item: ListItemModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailController")
        if let view = viewController as? DetailViewController {
            let presenter: DetailPresenterProtocol = DetailPresenter()
            let router: DetailPresenterToRouterProtocol = DetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.item = item
            presenter.router = router
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
      
}
