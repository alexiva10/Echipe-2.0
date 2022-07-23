//
//  EchipaModel.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import Foundation

class EchipaModel: ObservableObject {
    
    @Published var echipe = [Echipa]()
    
    init() {
        self.echipe = DataService.getLocalData()
    }
}
