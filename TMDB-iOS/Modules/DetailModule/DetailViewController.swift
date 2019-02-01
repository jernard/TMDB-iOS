//
//  DetailViewController.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 1/26/19.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var clasificationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension DetailViewController: DetailPresenterToViewProtocol{
    
    func showDetail(item: ListItemModel) {
        titleLabel.text = item.title
        rateLabel.text = "\(item.rate) ☆"
        dateLabel.text = "\(item.date.split(separator: "-")[0])"
        clasificationLabel.text = {
            if item.clasification!{
                return "17+"
            }
            return "For All"
        }()
        genderLabel.text = item.gender
        overviewTextView.text = item.overview
        
        
        image?.af_setImage(withURL: URL(string: "\(APIConstants.base_image_url)\(item.backdrop)")!)
    }
}

