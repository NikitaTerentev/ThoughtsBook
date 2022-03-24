//
//  BookVC.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import UIKit
import RealmSwift

class BookVC: UIViewController {
    
    private lazy var customView = BookView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //MARK: - Working with additing books
    
    @objc func newBookLabel() {

        let newImage = Converter.shared.convertImageToBase64String(img: customView.image.image ?? #imageLiteral(resourceName: "liter"))
        let realm = try! Realm()
        let model = BooksModel()
        model.book = customView.tf.text ?? ""
        model.author = customView.secondTf.text ?? ""
        model.currentImage = newImage
        
        let currentModel = BooksModel(value: model)
        try! realm.write {
            realm.add(currentModel)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UI

    private func setupUI() {
        customView.button.addTarget(self, action: #selector(newBookLabel), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTapping(recognizer:)))
            singleTap.numberOfTapsRequired = 1
            customView.image.addGestureRecognizer(singleTap)
    }
 
}

//MARK: - UIImagePickerController

extension BookVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func singleTapping(recognizer: UIGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            customView.image.image = image

        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
