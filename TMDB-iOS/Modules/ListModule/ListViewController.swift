 //
//  ListViewController.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import UIKit
import PKHUD
import collection_view_layouts

class ListViewController: UIViewController {
    
    @IBOutlet weak var nativationItem: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: ViewToPresentProtocol?
    var index: Int?
    var identificator: String?
    var itemList: [ListItemModel] = []
    var filteredItems: [ListItemModel] = []
    var cellIdentificator: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        initSearchController()
        presenter?.startFetchingList(identificator: identificator!)
        
    }
    
    //MARK: - Init SearchBar and add to navigation bar
    private func initSearchController(){
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "search movie/series"
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    // MARK: - Init collection View and set layout
    private func initCollectionView(){
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        let flowLayout: ContentDynamicLayout = PinterestStyleFlowLayout()
        flowLayout.delegate = self
        flowLayout.contentPadding = ItemsPadding(horizontal: 10, vertical: 10)
        flowLayout.cellsPadding = ItemsPadding(horizontal: 8, vertical: 8)
        flowLayout.contentAlign = .left
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
     
    }
    
}

extension ListViewController: PresenterToViewProtocol{
    func showList(ListItems: [ListItemModel]) {
        itemList = ListItems
        collectionView.reloadData()
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
}

 extension ListViewController: ContentDynamicLayoutDelegate {
    
    func cellSize(indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
 }
 
extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredItems.count
        }
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentificator!, for: indexPath)
                if let itemCell = cell as? ListItemCell {
            if isFiltering(){
                itemCell.set(item: filteredItems[indexPath.item])
            }else {
                itemCell.set(item: itemList[indexPath.item])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showDetailController(model: itemList[indexPath.item], identificator: identificator!)
    }
    
}

 extension ListViewController: UISearchResultsUpdating {
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // MARK: - Filter item list by text in searchbar
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredItems = itemList.filter({( item : ListItemModel) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
        
        collectionView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
 
