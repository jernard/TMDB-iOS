//
//  ListProtocols.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresentProtocol {
    var popular: PresenterToViewProtocol? {get set}
    var toprated: PresenterToViewProtocol? {get set}
    var upcoming: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol?{get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func startFetchingList(identificator: String)
    func showDetailController(model: ListItemModel, identificator: String)
}

protocol PresenterToViewProtocol: class{
    var presenter: ViewToPresentProtocol? { get set }
    var identificator: String? {get set}
    var cellIdentificator: String? {get set}
    
    func showList(ListItems: [ListItemModel])
    func showLoading()
    func hideLoading()
    func showError()
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    var apiClient: InteractorToApiClientProtocol? {get set}
    func fetchList(identificator: String)
}

protocol PresenterToRouterProtocol {
    static func createModule(identificator: String)-> UIViewController
    func pushToDetailScreen(view: PresenterToViewProtocol, forPost: ListItemModel)
}

protocol InteractorToPresenterProtocol: class {
    func listFetchedSuccess(listItemsModel: [ListItemModel], identificator: String)
    func listFetchFailed(identificator: String)
}

protocol InteractorToApiClientProtocol {
    var requestHandler: ApiClientToInteractorProtocol? {get set}
    
    func fetchList(identificator: String)
}

protocol ApiClientToInteractorProtocol {
    
    func fetchSuccess(listItems: [ListItemModel], identificator: String)
    func fetchError(identificator: String)
}

