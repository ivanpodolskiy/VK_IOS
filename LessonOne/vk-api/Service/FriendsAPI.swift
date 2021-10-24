//
//  FriendsAPI.swift
//  LessonOne
//
//  Created by user on 22.10.2021.
//

import Foundation
import Alamofire
<<<<<<< Updated upstream
=======
import SwiftyJSON

>>>>>>> Stashed changes

struct Friend {
    
}
final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    
<<<<<<< Updated upstream
    func getFriends(completion: @escaping([Friend]) -> ()) {
=======
    func getFriends(completion: @escaping([FriendsJSON]) -> ()) {
>>>>>>> Stashed changes
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userID,
            "order": "name",
<<<<<<< Updated upstream
            "fields": "photo_50",
=======
            "fields": "photo_100",
>>>>>>> Stashed changes
            "count": 50,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
<<<<<<< Updated upstream
            print (response.value)
=======
            
            guard let data = response.data else { return}
            debugPrint (response.data?.prettyJSON)
            //            print (response.value)
            
            do {
                let friendJSON = try JSON(data)["response"]["items"].rawData()
                
                let friends = try JSONDecoder().decode([FriendsJSON].self, from: friendJSON)
                completion(friends)
                
            } catch {
                print(error)
            }

>>>>>>> Stashed changes
        }
    }
}
