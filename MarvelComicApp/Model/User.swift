//
//  File.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 06/03/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import Foundation
import UIKit

class User {
    var username: String
    var image: UIImage
    var readComics: [Comic]
    var collectedComics: [Comic]
    
    init(username: String) {
        self.username = username
        self.image = UIImage(named: "spiderman")!
        self.readComics = [Comic]()
        self.collectedComics = [Comic]()
    }
    
    func isRead(comic: Comic) -> Bool {
        for c in readComics{
            if(c.collection == comic.collection && c.number == comic.number){
                print(comic.title)
                return true
            }
        }
        return false
    }
    
    func isCollected(comic: Comic) -> Bool {
        for c in collectedComics{
            if(c.collection == comic.collection && c.number == comic.number){
                return true
            }
        }
        return false
    }
    
    
    func toggleRead(comic: Comic) {
        if(isRead(comic: comic)){
            readComics.removeAll(where: {$0.collection == comic.collection && $0.number == comic.number})
        }else{
            readComics.append(comic)
        }
    }
    
    func toggleCollected(comic: Comic) {
        if(isCollected(comic: comic)){
            collectedComics.removeAll(where: {$0.collection == comic.collection && $0.number == comic.number})
        }else{
            collectedComics.append(comic)
        }
    }
    
}
