//
//  GroupsAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire
<<<<<<< Updated upstream

struct Group {

}
=======
import SwiftyJSON


>>>>>>> Stashed changes

final class GroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
<<<<<<< Updated upstream
    func getGroups(completion: @escaping([Group]) -> ()) {
=======
    func getGroups(completion: @escaping([GroupsJSON]) -> ()) {
>>>>>>> Stashed changes
        let method = "/groups.get"
        let parametrs: Parameters = [
            "access_token": token,
            "user_id": userId,
<<<<<<< Updated upstream
            "count": 10,
=======
            "count": 50,
>>>>>>> Stashed changes
            "v": version,
//            "fields": "city",
            "extended": 1
            
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
<<<<<<< Updated upstream
            
            print (response.value)
=======
            guard let data = response.data else {return}
            debugPrint(response.data?.prettyJSON)
            
            do {
                let groupJSON = try JSON(data)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([GroupsJSON].self, from: groupJSON)
                
                completion(groups)
            } catch {
                print (error)
            }
            
//            print (response.value)
>>>>>>> Stashed changes
        }
    }
}
