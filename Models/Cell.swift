//
//  Cell.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import UIKit

class Cell: UITableViewCell {
    
    static var shared = Cell()
    
    var bookLabel = UILabel()
    var authorLabel = UILabel()
    var imageBook = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        imageBook.translatesAutoresizingMaskIntoConstraints = false
        
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.textColor = .black
        bookLabel.font = UIFont.systemFont(ofSize: 15)
        bookLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.systemFont(ofSize: 12)
        authorLabel.textColor = .black
        
        contentView.addSubview(bookLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(imageBook)
        
        NSLayoutConstraint.activate([
            
            imageBook.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageBook.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageBook.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            imageBook.heightAnchor.constraint(equalToConstant: 50),
            imageBook.widthAnchor.constraint(equalToConstant: 50),
            
            bookLabel.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: 5),
            bookLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            bookLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            authorLabel.leadingAnchor.constraint(equalTo: bookLabel.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 5)
            
            
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(model: BooksModel) {
        
        self.bookLabel.text = model.book
        self.authorLabel.text = model.author
        let newImage = Converter.shared.convertBase64StringToImage(imageBase64String: model.currentImage)
        self.imageBook.image = newImage
    }

}
