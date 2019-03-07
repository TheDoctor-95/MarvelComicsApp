//
//  HomeViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 12/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

var comics: [Comic] = [Comic]()

var user = User(username: "TheDoctor95")

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
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
        
        if(user.isRead(comic: comic)){
            print(comic.title)
            myCell.btnReadImage.image = UIImage(named: "read-red")
        }else{
            myCell.btnReadImage.image = UIImage(named: "read-black")
        }
        
        if(user.isCollected(comic: comic)){
            myCell.btnCollectImage.image = UIImage(named: "collect-red")
        }else{
            myCell.btnCollectImage.image = UIImage(named: "collect-black")
        }
        
        
        
        myCell.btnCollect.addTarget(self, action: #selector(clickCollect), for: .touchUpInside)
        
        myCell.btnRead.tag = indexPath.row
        myCell.btnRead.addTarget(self, action: #selector(clickRead), for: .touchUpInside)
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        vc.comic = comics[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func clickCollect(sender: UIButton) {
        print("Has pulsado collect", sender.tag)
        user.toggleCollected(comic: comics[sender.tag])
        
        tableView.reloadData()
    }
    
    @objc func clickRead(sender: UIButton) {
        print("Has pulsado read", sender.tag)
        
        user.toggleRead(comic: comics[sender.tag])
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
}
