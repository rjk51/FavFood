//
//  DataModel.swift
//  FavFood
//
//  Created by rjk on 11/11/24.
//
import UIKit

struct FoodPlace {
    let name: String
    let address: String
    let category: String
    let image: UIImage
    
}

let foodPlaces: [FoodPlace] = [
    FoodPlace(name: "Cafe Deadend", address: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", category: "Coffee & Tea Shop", image: UIImage(named: "image1")!),
    FoodPlace(name: "Homei", address: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", category: "Cafe", image: UIImage(named: "image2")!),
    FoodPlace(name: "Teakha", address: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", category: "Tea House", image: UIImage(named: "image3")!),
    FoodPlace(name: "Cafe Loisl", address: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", category: "Austrian / Casual Drink", image: UIImage(named: "image4")!),
    FoodPlace(name: "Petite Oyster", address: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", category: "French", image: UIImage(named: "image5")!),
    FoodPlace(name: "Po's Atelier", address: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", category: "Bakery", image: UIImage(named: "image6")!),
    FoodPlace(name: "For Kee Restaurant", address: "Shop J-K, 200 Hollywood Road, Sheung Wan, Hong Kong", category: "Hong Kong Style", image: UIImage(named: "image7")!),
    FoodPlace(name: "21grams", address: "21 New Street, Sheung Wan, Hong Kong", category: "Mediterranean", image: UIImage(named: "image8")!),
]
