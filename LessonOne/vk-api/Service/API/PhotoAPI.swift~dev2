//
//  PhotoAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire
<<<<<<< HEAD
import SwiftyJSON
=======
>>>>>>> main

//struct Photo {
//    
//}

final class PhotoAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    
    
<<<<<<< HEAD
    func getPhoto(completion: @escaping([PhotoModel]) -> ()) {
=======
    func getPhoto(completion: @escaping([PhotoBD]) -> ()) {
>>>>>>> main
        let method = "/photos.getAll"
        
        let parametrs: Parameters = [
            "owner_id": 307096492,
            "access_token":token,
            "v":version,
            //            "no_service_albums": 0,
            "count": 3,
            "extended":1,
            "skip_hidden" : 1
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
            
            guard let data = response.data else {return}
            debugPrint(response.data?.prettyJSON)
<<<<<<< HEAD
            
            do {
                let photoJSON = try JSON(data)["response"]["items"].rawData()
                let photo = try JSONDecoder().decode([PhotoModel].self, from: photoJSON)
                
                completion(photo)
            } catch {
                print (error)
            }
            
=======
>>>>>>> main
        }
    }
}
