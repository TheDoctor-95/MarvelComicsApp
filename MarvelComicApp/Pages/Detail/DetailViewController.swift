//
//  DetailViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 05/03/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var comic: Comic?
    
    
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var titleComic: UILabel!
    @IBOutlet weak var colection: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var readIcon: UIImageView!
    @IBOutlet weak var collecItem: UIImageView!
    @IBOutlet weak var descripcio: UILabel!
    
    @IBOutlet weak var collectImage: UIImageView!
    
    @IBOutlet weak var readImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        portada.image = comic!.image
        titleComic.text = comic!.title != "null" ? comic!.title : ""
        colection.text = "\(comic!.collection) #\(comic!.number)"
        descripcio.text = comic!.description
        
        loadRead()
        
        loadCollect()
        
        
    }
    
    @IBAction func readClick(_ sender: Any) {
        user.toggleRead(comic: comic!)
        loadRead()
    }
    
    func loadRead() {
        if(user.isRead(comic: comic!)){
            print(comic!.title)
            readImage.image = UIImage(named: "read-red")
        }else{
            readImage.image = UIImage(named: "read-black")
        }
    }
    
    @IBAction func collectClick(_ sender: Any) {
        user.toggleCollected(comic: comic!)
        loadCollect()
    }
    
    func loadCollect() {
        if(user.isCollected(comic: comic!)){
            collectImage.image = UIImage(named: "collect-red")
        }else{
            collectImage.image = UIImage(named: "collect-black")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
