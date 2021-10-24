//
//  SearchGropsAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire
<<<<<<< Updated upstream

struct Groups {
    

}
=======
import SwiftyJSON

>>>>>>> Stashed changes

final class SearchGropsAPI {
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    let searchRequest = "Music"
    
<<<<<<< Updated upstream
    func searchGroups(completion: @escaping([Groups]) -> ()) {
=======
    func searchGroups(completion: @escaping([SearchGropsJSON]) -> ()) {
>>>>>>> Stashed changes
        let method = "/groups.search"
        
        let parametrs: Parameters = [
            "q":searchRequest,
            "access_token":token,
            "v":version
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
<<<<<<< Updated upstream
            print (response.value)
=======
            guard let data = response.data else {return}
            debugPrint(response.data?.prettyJSON)
      //    print (response.value)
            
            do {
                let searchGroupJSON = try JSON(data)["response"]["items"].rawData()
       let searchGroup = try JSONDecoder().decode([SearchGropsJSON].self, from: searchGroupJSON)
                
                completion(searchGroup)
                
                
            } catch {
                print(error)
            }
>>>>>>> Stashed changes
        }
    }
}
