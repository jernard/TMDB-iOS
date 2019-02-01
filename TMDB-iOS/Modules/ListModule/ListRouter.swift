//
//  ListRouter.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit

class ListRouter: PresenterToRouterProtocol {
    
    class func createModule(identificator: String) -> UIViewController {
        let tabController = mainStoryboard.instantiateViewController(withIdentifier: identificator)
        
        switch identificator {
        case "TabBarController":
            if let popular = tabController.children.first?.children.first as? ListViewController, let toprated = tabController.children[1].children.first as? ListViewController, let upcoming = tabController.children[2].children.first as? ListViewController{
                
                popular.identificator = "popular"
                toprated.identificator = "toprated"
                upcoming.identificator = "upcoming"
                
                var presenter: ViewToPresentProtocol & InteractorToPresenterProtocol = ListPresenter()
                var interactor: PresenterToInteractorProtocol & ApiClientToInteractorProtocol = ListInteractor()
                let router: PresenterToRouterProtocol = ListRouter()
                var apiClient: InteractorToApiClientProtocol = APICLient()
                
                
                popular.presenter = presenter
                toprated.presenter = presenter
                upcoming.presenter = presenter
                popular.cellIdentificator = "ListItemCellPOP"
                toprated.cellIdentificator = "ListItemCellTR"
                upcoming.cellIdentificator = "ListItemCellUP"
                presenter.popular = popular
                presenter.toprated = toprated
                presenter.upcoming = upcoming
                presenter.router = router
                presenter.interactor = interactor
                interactor.presenter = presenter
                interactor.apiClient = apiClient
                apiClient.requestHandler = interactor
                
                return tabController
            }
        default:
            print("identificator: \(identificator)")
            break
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func pushToDetailScreen(view: PresenterToViewProtocol, forPost: ListItemModel) {
        let detailViewController = DetailRouter.createDetailModule(item: forPost)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    
}
