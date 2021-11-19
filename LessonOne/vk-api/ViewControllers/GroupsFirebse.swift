//
//  GroupsFirebse.swift
//  LessonOne
//
//  Created by user on 18.11.2021.
//

import Foundation
import Firebase

class GroupsFirebse {
    var name: String
    
    let ref: DatabaseReference!
    
    init(name: String) {
        // 2
        self.ref = nil
        self.name = name
        
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
    
        ]
    }
}
