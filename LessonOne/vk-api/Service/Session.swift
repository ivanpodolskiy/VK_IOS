//
//  Session.swift
//  LessonOne
//
//  Created by user on 16.10.2021.
//


import Foundation

class Session {
    private init() {}
    
    static let shared = Session()
    
    var token: String = ""
    var userId: String = ""
    
}
