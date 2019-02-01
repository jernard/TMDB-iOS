//
//  ListItenractor.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation

class ListInteractor: PresenterToInteractorProtocol{
    var apiClient: InteractorToApiClientProtocol?
    var presenter: InteractorToPresenterProtocol?
    
    func fetchList(identificator: String) {
        
        apiClient?.fetchList(identificator: identificator)
    }
}

extension ListInteractor: ApiClientToInteractorProtocol{
    func fetchSuccess(listItems: [ListItemModel], identificator: String) {
        presenter?.listFetchedSuccess(listItemsModel: listItems, identificator: identificator)
    }
    
    func fetchError(identificator: String) {
        presenter?.listFetchFailed(identificator: identificator)
    }
    
    
}
