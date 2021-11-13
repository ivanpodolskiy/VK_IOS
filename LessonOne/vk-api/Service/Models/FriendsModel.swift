//
//  FriendsModel.swift
//  LessonOne
//
//  Created by user on 25.10.2021.
//


import Foundation
import RealmSwift


class FriendsModel: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo50: String = ""
    @objc dynamic var firstName: String = ""
    
    var fullName: String {
        
        (firstName) + " " + (lastName)
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        
        case firstName = "first_name"
        
    }
}
