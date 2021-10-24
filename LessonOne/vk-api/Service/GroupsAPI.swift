//
//  GroupsAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire

struct Group {

}

final class GroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getGroups(completion: @escaping([Group]) -> ()) {
        let method = "/groups.get"
        let parametrs: Parameters = [
            "access_token": token,
            "user_id": userId,
            "count": 10,
            "v": version,
//            "fields": "city",
            "extended": 1
            
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
            
            print (response.value)
        }
    }
}
