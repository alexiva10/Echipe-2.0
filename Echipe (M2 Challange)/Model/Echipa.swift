//
//  Echipa.swift
//  Echipe (M2 Challange)
//
//  Created by Alex Ivanescu on 22.07.2022.
//

import Foundation

class Echipa:Identifiable, Decodable  {
    var id:UUID?
    var name:String
    var image:String
    var trofeeUCL:Int
    var jucatoriTop:[String]
}
