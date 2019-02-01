//
//  ListPresenter.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ViewToPresentProtocol {
    
    
    weak var popular: PresenterToViewProtocol?
    weak var toprated: PresenterToViewProtocol?
    weak var upcoming: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    func startFetchingList(identificator: String) {
        switch identificator {
        case "popular":
            popular?.showLoading()
        case "toprated":
            toprated?.showLoading()
        case "upcoming":
            upcoming?.showLoading()
        default:
            print("error in presenter delegate, no able identificator")
        }
        interactor?.fetchList(identificator: identificator)
    }
    
    func showDetailController(model: ListItemModel, identificator: String) {
        switch identificator {
        case "popular":
            router?.pushToDetailScreen(view: popular!, forPost: model)
        case "toprated":
            router?.pushToDetailScreen(view: toprated!, forPost: model)
        case "upcoming":
            router?.pushToDetailScreen(view: upcoming!, forPost: model)
        default:
            print("error in presenter, no able identificator")
        }   
    }
}

extension ListPresenter: InteractorToPresenterProtocol {

    func listFetchedSuccess(listItemsModel: [ListItemModel], identificator: String) {
        switch identificator {
        case "popular":
            popular?.hideLoading()
            popular?.showList(ListItems: listItemsModel)
        case "toprated":
            toprated?.hideLoading()
            toprated?.showList(ListItems: listItemsModel)
        case "upcoming":
            upcoming?.hideLoading()
            upcoming?.showList(ListItems: listItemsModel)
        default:
            print("error in presenter delegate, no able identificator")
        }
    }
    
    func listFetchFailed(identificator: String) {
        switch identificator {
        case "popular":
            popular?.showError()
            popular?.hideLoading()
        case "toprated":
            toprated?.showError()
            toprated?.hideLoading()
        case "upcoming":
            upcoming?.showError()
            upcoming?.hideLoading()
        default:
            print("error in presenter delegate, no able identificator")
        }
    }
    
}
