//
//  PhotoJSON.swift
//  LessonOne
//
//  Created by user on 24.10.2021.
//


import Foundation



// MARK: - Size
struct PhotoJSON: Codable {
    let width, height: Int
    let url: String
    let type: String
}
