//
//  Product.swift
//  AppleProducts

// Product
// ProductLine wil contain [Product]

import UIKit


enum ProductRating {
    case unrated
    case average
    case ok
    case good
    case brilliant
}



class Product {
    
    var image: UIImage
    var title: String
    var description: String
    var rating: ProductRating
    
    init(titled: String, description: String, imageName: String) {
        title = titled
        self.description = description
        if let image = UIImage(named: imageName) {
            self.image = image
        } else {
            self.image = UIImage(named: "default")!
        }
        
        rating = .unrated
    }
}

