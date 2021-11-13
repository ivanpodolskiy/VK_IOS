//
//  FriendsDB.swift
//  LessonOne
//
//  Created by user on 08.11.2021.
//

import Foundation
import RealmSwift

extension Results {
    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
 }

class FriendsDB {

    let migration = Realm.Configuration(schemaVersion: 5)

    
    func save(_ itme: [FriendsModel]){
        let realm = try! Realm(configuration: migration)
        do {
            realm.beginWrite()
            realm.add(itme)
            print(realm.configuration.fileURL ?? "Нет URL")
            try! realm.commitWrite()
        } catch {
            print (error.localizedDescription)
        }
        
    }
    
    func load() -> [FriendsModel] {
        let realm = try! Realm(configuration: migration)
            let someModelResults: Results<FriendsModel> = realm.objects(FriendsModel.self)
            let someModelArray: [FriendsModel] = someModelResults.toArray()
            return someModelArray
     
       
//        let friends: Results<FriendsModel> = realm.objects(FriendsModel.self)
     
    }
    
    func delete() {
        let realm = try! Realm(configuration: migration)
        try! realm.write {
          realm.deleteAll()
        }
    }

    
}
