//
//  ModelClass.swift
//  ImpetusOn
//
//  Created by Mithra on 25/05/23.
//

import Foundation


struct TaskEntry : Codable {
    
    var name : String?
    var id : Int?
}


struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}


