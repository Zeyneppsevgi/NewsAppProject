//
//  Webservice.swift
//  NewProject
//
//  Created by Zeynep Sevgi on 13.11.2022.
//

import Foundation

class Webservice {
    
    func haberleriIndir(url: URL, completion: @escaping([News]?) ->()){
        
        URLSession.shared.dataTask(with: url) { (data, responde,  error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let haberlerDizisi=try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                
            }
        
                
            }
        }.resume() //devam ettir demek bütün bu işlemler başlatmak için
        
    }
    
}
