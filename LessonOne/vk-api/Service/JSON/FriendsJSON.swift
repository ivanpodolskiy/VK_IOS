//
//  FriendsJSON.swift
//  LessonOne
//
//  Created by user on 24.10.2021.
//

import Foundation

//   let friendsJSON = try? newJSONDecoder().decode(FriendsJSON.self, from: jsonData)

import Foundation

// MARK: - FriendsJSON
//struct FriendsJSON: Codable {
//    let response: Response
//}

// MARK: - Response
//struct Response: Codable {
//    let count: Int
//    let items: [Item]
//}

// MARK: - Item
struct FriendsJSON: Codable {
    let id: Int
    let lastName: String
    let photo50: String
    let firstName: String
    
    var fullName: String {
        
        (firstName) + " " + (lastName)
        
    }
    
//    let deactivated: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_100"
//        case trackCode = "track_code"
        case firstName = "first_name"
//        case deactivated
    }
}
