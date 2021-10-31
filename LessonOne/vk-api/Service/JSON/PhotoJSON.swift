//
//  PhotoJSON.swift
//  LessonOne
//
//  Created by user on 25.10.2021.
//

import Foundation
import RealmSwift

// MARK: - Size
class PhotoBD: Object, Codable {
   @objc dynamic let width, height: Int
    @objc dynamic let url: String
    @objc dynamic let type: String
}
