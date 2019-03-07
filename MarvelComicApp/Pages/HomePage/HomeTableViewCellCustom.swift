//
//  HomeTableViewCellCustom.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 12/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class HomeTableViewCellCustom: UITableViewCell {

    @IBOutlet weak var PortadaImage: UIImageView!
    @IBOutlet weak var CollectionTitle: UILabel!
    @IBOutlet weak var ComicTitle: UILabel!
    @IBOutlet weak var writerName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var btnCollect: UIButton!
    @IBOutlet weak var btnRead: UIButton!
    @IBOutlet weak var btnCollectImage: UIImageView!
    @IBOutlet weak var btnReadImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
