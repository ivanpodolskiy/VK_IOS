//
//  PhotoModel.swift
//  LessonOne
//
//  Created by user on 25.10.2021.
//

import Foundation
import RealmSwift

// MARK: - PhotoModel
struct PhotoModel:  Codable {

    var albumID: Int
    var  postID, id, date: Int
    let text: String
    let realOffset: Int

    var sizes: [Size]
    let hasTags: Bool

    let ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text
        case realOffset = "real_offset"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"

    }
}




// MARK: - Size
struct Size:   Codable {
    let width, height: Int
    var  url: String
    let type: String
}
//
//class PhotoModel: Object, Codable {
//
//    var albumID: Int
//    @objc dynamic var  postID, id, date: Int
//    let text: String
//    let realOffset: Int
//
//    var sizes = List<Size>
//    let hasTags: Bool
//
//    let ownerID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case postID = "post_id"
//        case id, date, text
//        case realOffset = "real_offset"
//        case sizes
//        case hasTags = "has_tags"
//        case ownerID = "owner_id"
//
//    }
//}

//// MARK: - Size
//struct Size:   Codable {
//    let width, height: Int
//    @objc dynamic var  url: String
//    let type: String
//}
//
