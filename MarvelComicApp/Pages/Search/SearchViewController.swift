//
//  SearchViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 13/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filterComic:[Comic] = [Comic]()
    
    var isSearching:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !isSearching ? comics.count : filterComic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = !isSearching ? comics[indexPath.row] : filterComic[indexPath.row]
        
        let myCell = table.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCellCustom
       
        myCell.collectionLabel.text = "\(comic.collection) #\(comic.number)"
        myCell.titleLabel.text = comic.title != "null" ? comic.title : ""
        myCell.imageView?.image = comic.image
        
        myCell.readImage?.image = UIImage(named: user.isRead(comic: comic) ? "read-red" : "read-black")
        myCell.collectionImage?.image = UIImage(named: user.isCollected(comic: comic) ? "collect-red" : "collect-black")
        
        
        return myCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        vc.comic = !isSearching ? comics[indexPath.row] : filterComic[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let collect = collectAction(indexPath: indexPath)
        
        let read = readAction(indexPath: indexPath)
        
        return UISwipeActionsConfiguration(actions: [collect, read])
    }
    
    func collectAction(indexPath: IndexPath) -> UIContextualAction {
        let comic = !isSearching ? comics[indexPath.row] : filterComic[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: user.isCollected(comic: comic) ? "Uncollect" : "Collect") { (action, view, completion) in
            user.toggleCollected(comic: comic)
            
            self.table.reloadRows(at: [indexPath], with: .none)
            
            completion(true)
        }
        
        return action
    }
    
    func readAction(indexPath: IndexPath) -> UIContextualAction {
        let comic = !isSearching ? comics[indexPath.row] : filterComic[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: user.isRead(comic: comic) ? "Unread" : "Read") { (action, view, completion) in
            user.toggleRead(comic: comic)
            
            self.table.reloadRows(at: [indexPath], with: .none)
            
            
            
            completion(true)
        }
        
        return action
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterComic = comics.filter({ (comic) -> Bool in
            return comic.title.lowercased().contains(searchText.lowercased())
        })
        
        isSearching = searchText != "" ? true : false
        table.reloadData()
    }
    
    
}
