//
//  Converter.swift
//  ThoughBook
//
//  Created by Nikita on 24.03.2022.
//

import UIKit

class Converter {
    static let shared = Converter()
    
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data(base64Encoded: imageBase64String)
        let image = UIImage(data: imageData!)
        return image!
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
}
