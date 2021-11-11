//
//  FriendsJSON.swift
//  LessonOne
//
//  Created by user on 25.10.2021.
//


import Foundation
import RealmSwift


class FriendsBD: Object, Codable {
    @objc dynamic let id: Int
    @objc dynamic let lastName: String
    @objc dynamic let photo50: String
    @objc dynamic let firstName: String
    
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
