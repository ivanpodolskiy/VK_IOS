//
//  SearchGropsAPI.swift
//  LessonOne
//
//  Created by user on 23.10.2021.
//

import Foundation
import Alamofire

struct Groups {
    

}

final class SearchGropsAPI {
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userId
    let version = "5.81"
    let searchRequest = "Music"
    
    func searchGroups(completion: @escaping([Groups]) -> ()) {
        let method = "/groups.search"
        
        let parametrs: Parameters = [
            "q":searchRequest,
            "access_token":token,
            "v":version
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parametrs).responseJSON { response in
            print (response.value)
        }
    }
}
