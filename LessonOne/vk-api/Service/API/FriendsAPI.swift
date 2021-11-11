//
//  FriendsAPI.swift
//  LessonOne
//
//  Created by user on 22.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    
<<<<<<< HEAD
    func getFriends(completion: @escaping([FriendsModel]) -> ()) {
=======
    func getFriends(completion: @escaping([FriendsBD]) -> ()) {
>>>>>>> main
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userID,
            "order": "name",
            "fields": "photo_50",
            "count": 50,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            guard let data = response.data else { return}
            debugPrint (response.data?.prettyJSON)
            
            do {
                let friendJSON = try JSON(data)["response"]["items"].rawData()
                
<<<<<<< HEAD
                let friends = try JSONDecoder().decode([FriendsModel].self, from: friendJSON)
=======
                let friends = try JSONDecoder().decode([FriendsBD].self, from: friendJSON)
>>>>>>> main
                completion(friends)
                
            } catch {
                print(error)
            }
        }
    }
}
