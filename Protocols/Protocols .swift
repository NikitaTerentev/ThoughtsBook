//
//  Protocols .swift
//  ThoughBook
//
//  Created by Nikita on 24.03.2022.
//

import Foundation
import RealmSwift

protocol StorageManager {
    func save(model: BooksModel)
    func obtainModel() -> Results<BooksModel>
}


