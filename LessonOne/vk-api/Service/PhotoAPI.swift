//
//  PhotoAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire
<<<<<<< Updated upstream

struct Photo {
    
}
=======
import SwiftyJSON

>>>>>>> Stashed changes

final class PhotoAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    
    
<<<<<<< Updated upstream
    func getPhoto(completion: @escaping([Photo]) -> ()) {
=======
    func getPhoto(completion: @escaping([PhotoJSON]) -> ()) {
>>>>>>> Stashed changes
    let method = "/photos.getAll"
    
        let parametrs: Parameters = [
            "owner_id": 307096492,
            "access_token":token,
            "v":version,
//            "no_service_albums": 0,
            "count": 3,
<<<<<<< Updated upstream
=======
            "photo_sizes":0,
>>>>>>> Stashed changes
            "extended":1,
            "skip_hidden" : 1
        ]
    let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
<<<<<<< Updated upstream
            print (response.value)
=======
            
            guard let data = response.data else {return}
            debugPrint(response.data?.prettyJSON)
            
            do {
                
                let photoJSON = try JSON(data)["response"]["items"].rawData()
            let photo = try JSONDecoder().decode([PhotoJSON].self, from: photoJSON)
                
                completion(photo)
            } catch {
                print (error)
            }
            
//            print (response.value)
>>>>>>> Stashed changes
        }
    }
}
