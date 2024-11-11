//
//  DetailViewController.swift
//  FavFood
//
//  Created by rjk on 11/11/24.
//

import UIKit

class DetailViewController: UIViewController {

    var foodPlace: FoodPlace?

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        setupUI()
        updateFavoriteButton()
    }
    
    private func setupUI() {
        guard let foodPlace = foodPlace else { return }
        foodImageView.image = foodPlace.image
        nameLabel.text = foodPlace.name
        categoryLabel.text = foodPlace.category
        descriptionLabel.text = """
        An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA, and Japan.
        """
        addressLabel.text = foodPlace.address
        phoneLabel.text = "983-284334"
    }
    
    @objc private func saveButtonTapped() {
        guard let foodPlace = foodPlace else { return }
        
        saveFoodPlaceToLocalStorage(foodPlace)
        
        print("Saved FoodPlace: \(foodPlace)")
    }
    
    private func saveFoodPlaceToLocalStorage(_ foodPlace: FoodPlace) {
        let defaults = UserDefaults.standard
        
        var savedFoodPlaces = getSavedFoodPlaces()
        
        if !savedFoodPlaces.contains(where: { $0.name == foodPlace.name }) {
            savedFoodPlaces.append(foodPlace)
        }
        
        let foodPlaceData = savedFoodPlaces.map { ["name": $0.name, "address": $0.address, "category": $0.category] }
        
        defaults.set(foodPlaceData, forKey: "savedFoodPlaces")
    }
    
    private func getSavedFoodPlaces() -> [FoodPlace] {
        let defaults = UserDefaults.standard
        
        guard let savedData = defaults.array(forKey: "savedFoodPlaces") as? [[String: String]] else {
            return []
        }
        
        return savedData.compactMap { dict in
            if let name = dict["name"], let address = dict["address"], let category = dict["category"] {
                return FoodPlace(name: name, address: address, category: category, image: UIImage(named: "image1")!)
            }
            return nil
        }
    }
    
    // MARK: - Favorite Button Functionality
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let foodPlace = foodPlace else { return }
        
        var favorites = getFavorites()
        
        if favorites.contains(where: { $0.name == foodPlace.name }) {
            favorites.removeAll { $0.name == foodPlace.name }
        } else {
            favorites.append(foodPlace)
        }
        
        saveFavorites(favorites)
        print("Favorite FoodPlace: \(foodPlace)")
        updateFavoriteButton()
    }
    
    private func updateFavoriteButton() {
        guard let foodPlace = foodPlace else { return }
        
        let favorites = getFavorites()
        let isFavorited = favorites.contains(where: { $0.name == foodPlace.name })
        
        let buttonImage = isFavorited ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        favoriteButton.setImage(buttonImage, for: .normal)
    }
    
    private func saveFavorites(_ favorites: [FoodPlace]) {
        let defaults = UserDefaults.standard
        
        let favoritesData = favorites.map { ["name": $0.name, "address": $0.address, "category": $0.category] }
        
        defaults.set(favoritesData, forKey: "favorites")
    }
    
    private func getFavorites() -> [FoodPlace] {
        let defaults = UserDefaults.standard
        
        guard let savedFavorites = defaults.array(forKey: "favorites") as? [[String: String]] else {
            return []
        }
        
        return savedFavorites.compactMap { dict in
            if let name = dict["name"], let address = dict["address"], let category = dict["category"] {
                return FoodPlace(name: name, address: address, category: category, image: UIImage(named: "image1")!)
            }
            return nil
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
