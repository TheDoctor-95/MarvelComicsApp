//
//  HomeViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 12/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

var comics: [Comic] = [Comic]()

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var tools: Tools = Tools();
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tools.parseCSVComic(comics: &comics)
        
        for comic in comics{
            print(comic.collection, comic.number, comic.title)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCellCustom
        let comic: Comic = comics[indexPath.row]
        
        myCell.CollectionTitle.text = "\(comic.collection) #\(comic.number)"
        myCell.ComicTitle.text = comic.title != "null" ? comic.title : ""
        myCell.artistName.text = comic.artist
        myCell.writerName.text = comic.writer
        
       myCell.PortadaImage.image = comic.image
        
        myCell.btnCollect.tag = indexPath.row
        
        myCell.btnCollect.addTarget(self, action: #selector(clickCollect), for: .touchUpInside)
        
        myCell.btnRead.tag = indexPath.row
        myCell.btnRead.addTarget(self, action: #selector(clickRead), for: .touchUpInside)
        
        return myCell
    }

    @objc func clickCollect(sender: UIButton) {
        print("Has pulsado collect", sender.tag)
    }
    
    @objc func clickRead(sender: UIButton) {
        print("Has pulsado red", sender.tag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
}
