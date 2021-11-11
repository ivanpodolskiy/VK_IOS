//
//  GroupsAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Group {
    
}

final class GroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
<<<<<<< HEAD
    func getGroups(completion: @escaping([GroupsModel]) -> ()) {
=======
    func getGroups(completion: @escaping([GroupsBD]) -> ()) {
>>>>>>> main
        let method = "/groups.get"
        let parametrs: Parameters = [
            "access_token": token,
            "user_id": userId,
            "count": 40,
            "v": version,
            //            "fields": "city",
            "extended": 1
            
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
            
            guard let data = response.data else {return}
            debugPrint(response.data?.prettyJSON)
            
            do {
                let groupJSON = try JSON(data)["response"]["items"].rawData()
<<<<<<< HEAD
                let groups = try JSONDecoder().decode([GroupsModel].self, from: groupJSON)
=======
                let groups = try JSONDecoder().decode([GroupsBD].self, from: groupJSON)
>>>>>>> main
                
                completion(groups)
            } catch {
                print (error)
            }
        }
    }
}
