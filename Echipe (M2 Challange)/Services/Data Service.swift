//
//  Data Service.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Echipa] {
        
        let pathString = Bundle.main.path(forResource: "echipe", ofType: "json")
        
        guard pathString != nil else {
            return [Echipa]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let echipeData = try decoder.decode([Echipa].self, from: data)
                
                for r in echipeData {
                    r.id = UUID()
                    
                    for i in r.istorie {
                        i.id = UUID()
                    }
                }
                
                return echipeData
            } catch {
                print(error)
            }
            
           
            
            
        } catch {
            print(error)
        }
        
        return [Echipa]()
    }
}

