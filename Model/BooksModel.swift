//
//  BooksModel.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import Foundation
import Foundation
import RealmSwift


@objcMembers
class BooksModel: Object  {
        
    dynamic var book = String()
    dynamic var author = String()
    dynamic var currentImage = String()

}
