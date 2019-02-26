//
//  Tools.swift
//  MarvelComicApp
//
//  Created by Pau Duran on 13/02/2019.
//  Copyright © 2019 Pau Duran. All rights reserved.
//

import Foundation
import UIKit
class Tools{
    
    func parseCSVComic(comics: inout [Comic]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "Comics", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {
                let comic = Comic(collection: row["coleccion"]!, number: row["numero"]!, title: row["titulo"] != "" ? row["titulo"]! : "null",writer: row["writer"]!,artist: row["artist"]!, description: row["descripcion"]!)
                if(row["imageUrl"] != ""){
                    let url = URL (string: row["imageUrl"]!)
                    
                    if let data = try? Data(contentsOf: url!){
                        DispatchQueue.main.async {
                            comic.image = UIImage(data: data)!
                        }
                    }
                }
                comics.append(comic)
            }
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
}
    
    /*func getImage(url: String) -> UIImage{
        
    }*/

}
