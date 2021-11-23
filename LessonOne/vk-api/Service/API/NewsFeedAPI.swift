//
//  NewsFeedAPI.swift
//  LessonOne
//
//  Created by user on 19.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON



final class NewsFeedAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    
    func getNewsfeed(completion: @escaping([Item]) -> ()) {
        
        let method = "/newsfeed.get"
        
        let parameters: Parameters = [
            "user_id": userID,
            "access_token": token,
            "filters":"post,photo,photo_tag,wall_photo",
            "count": 1,
            "v": version,
            "start_from": 0
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            guard let data = response.data else { return}
            debugPrint (response.data?.prettyJSON)
            print (self.userID)
            
            do {
                let newJSON = try JSON(data)["response"]["items"].rawData()
                let new = try JSONDecoder().decode([Item].self, from: newJSON)
                completion(new)
            } catch {
                print (error)
        }
    }
}
}
