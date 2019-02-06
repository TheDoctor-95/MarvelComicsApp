//
//  TabBarController.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 06/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        
        UITabBar.appearance().barTintColor = UIColor.red
        
        for i in 0...(self.tabBar.items!.count-1){
            tabBarItem = self.tabBar.items![i]
            
            if(i == 0){
                tabBarItem.image = UIImage(named: "home-black")?.withRenderingMode(.alwaysOriginal)
                tabBarItem.selectedImage = UIImage(named: "home-white")?.withRenderingMode(.alwaysOriginal)
            }else if( i == 1){
                tabBarItem.image = UIImage(named: "search-black")?.withRenderingMode(.alwaysOriginal)
                tabBarItem.selectedImage = UIImage(named: "search-white")?.withRenderingMode(.alwaysOriginal)
            }else if(i==2){
                tabBarItem.image = UIImage(named: "profile-black")?.withRenderingMode(.alwaysOriginal)
                tabBarItem.selectedImage = UIImage(named: "profile-white")?.withRenderingMode(.alwaysOriginal)
            }else {
                tabBarItem.image = UIImage(named: "about-black")?.withRenderingMode(.alwaysOriginal)
                tabBarItem.selectedImage = UIImage(named: "about-white")?.withRenderingMode(.alwaysOriginal)
            }
            
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
