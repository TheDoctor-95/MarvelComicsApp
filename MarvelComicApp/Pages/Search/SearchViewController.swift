//
//  SearchViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 13/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    

    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = comics[indexPath.row]
        
        let myCell = table.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCellCustom
       
        myCell.collectionLabel.text = "\(comic.collection) #\(comic.number)"
        myCell.titleLabel.text = comic.title != "null" ? comic.title : ""
        myCell.imageView?.image = comic.image
        
        return myCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        vc.comic = comics[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
