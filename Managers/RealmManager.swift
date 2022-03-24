//
//  RealmManager.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import Foundation
import RealmSwift

class RealmManager: StorageManager {
    
    fileprivate lazy var mainRealm = try! Realm(configuration: .defaultConfiguration)

    func save(model: BooksModel) {
        
        try! mainRealm.write {
            
            mainRealm.add(model)
        }
    }
    
    func obtainModel() -> Results<BooksModel> {
        
        let models = mainRealm.objects(BooksModel.self)
        
        return models
    }
    
}
