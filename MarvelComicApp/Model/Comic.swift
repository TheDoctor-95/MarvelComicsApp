//
//  Comic.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 13/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import Foundation
import UIKit

class Comic {
    
    var collection: String
    var number: String
    var title: String
    var writer: String
    var artist: String
    var description: String
    var image: UIImage
    
    init(collection: String, number: String, title: String,writer: String,artist: String, description: String) {
        self.collection = collection
        self.number = number
        self.title = title
        self.writer = writer
        self.artist = artist
        self.description = description
        self.image = UIImage()
    }
}
