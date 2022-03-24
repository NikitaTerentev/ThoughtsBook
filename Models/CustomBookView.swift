//
//  CustomBookView.swift
//  ThoughBook
//
//  Created by Nikita on 19.03.2022.
//

import UIKit

class BookView: UIView{
    
            
    var image : UIImageView
    var tf: UITextField
    var secondTf: UITextField
    var button: UIButton
    
    
    init() {
        image = .init()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "liter")
        image.isUserInteractionEnabled = true

        tf = .init()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Название книги"
        tf.textAlignment = .center
        tf.textColor = .black

        
                
        button = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        
        secondTf = .init()
        secondTf.translatesAutoresizingMaskIntoConstraints = false
        secondTf.placeholder = "Автор книги"
        secondTf.textAlignment = .center
        secondTf.textColor = .black
        
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        setupConstraints()
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
   
        button.backgroundColor = .blue
        button.setTitle("Сохранить", for: .normal)
        button.tintColor = .blue
    }
    
    private func setupView() {
        addSubview(image)
        addSubview(tf)
        addSubview(button)
        addSubview(secondTf)
    }
    
    private func setupConstraints() {
    NSLayoutConstraint.activate([
    
        //imageView
        
        image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
        image.centerXAnchor.constraint(equalTo: centerXAnchor),
        image.widthAnchor.constraint(equalToConstant: 300),
        image.heightAnchor.constraint(equalToConstant: 300),
        
        //second tf
        
        secondTf.centerXAnchor.constraint(equalTo: centerXAnchor),
        secondTf.bottomAnchor.constraint(equalTo: tf.topAnchor),
        secondTf.widthAnchor.constraint(equalToConstant: 200),
        secondTf.heightAnchor.constraint(equalToConstant: 50),
        
        
        //tf
        
        tf.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 100),
        tf.centerXAnchor.constraint(equalTo: centerXAnchor),
        tf.widthAnchor.constraint(equalToConstant: 100),
        tf.heightAnchor.constraint(equalToConstant: 50),
    
        
        //button
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        button.centerXAnchor.constraint(equalTo: centerXAnchor),
        button.heightAnchor.constraint(equalToConstant: 50),
        button.widthAnchor.constraint(equalToConstant: 200)
    ])
    
    }
    
    
}
