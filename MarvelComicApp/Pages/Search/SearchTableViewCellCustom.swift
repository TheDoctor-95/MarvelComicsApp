//
//  SearchTableViewCellCustom.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 13/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class SearchTableViewCellCustom: UITableViewCell {

    @IBOutlet weak var portadaImage: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readImage: UIImageView!
    @IBOutlet weak var collectionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
