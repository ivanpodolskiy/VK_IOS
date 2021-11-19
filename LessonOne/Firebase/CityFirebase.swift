//
//  CityFirebase.swift
//  LessonOne
//
//  Created by user on 17.11.2021.
//

import Foundation
import Firebase

class CityFirebase {
    // 1
    let name: String
    let zipcode: Int
    let ref: DatabaseReference?
    
    init(name: String, zipcode: Int) {
        // 2
        self.ref = nil
        self.name = name
        self.zipcode = zipcode
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.zipcode = zipcode
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            "zipcode": zipcode
        ]
    }
}

