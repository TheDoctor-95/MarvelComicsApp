//
//  ProfileViewController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 06/03/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        
        CollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.collectedComics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let comic = user.collectedComics[indexPath.row]
        let myCell = CollectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! CollectionViewCellCustom
        
        myCell.image.image = comic.image
        
        if(user.isRead(comic: comic)){
            myCell.bookmark.isHidden = false
        }else{
            myCell.bookmark.isHidden = true
        }
        
        return myCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        
        vc.comic = user.collectedComics[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
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
