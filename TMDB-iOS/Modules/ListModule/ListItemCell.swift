//
//  imageCell.swift
//  TMDB-iOS
//
//  Created by Jernard Ducon on 2019-01-24.
//  Copyright © 2019 Jernard Ducon. All rights reserved.
//

import UIKit
import AlamofireImage

class ListItemCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    func set(item: ListItemModel){
        self.titleLabel.text = item.title
        self.yearLabel.text = "\(item.date.split(separator: "-")[0])"
        self.rateLabel.text = "\(item.rate)☆"
        image?.af_setImage(withURL: URL(string: "\(APIConstants.base_image_url)\(item.image)")!)
    }
    

}
