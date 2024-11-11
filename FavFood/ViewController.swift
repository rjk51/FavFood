//
//  ViewController.swift
//  FavFood
//
//  Created by rjk on 11/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // Array to hold filtered search results
    var filteredFoodPlaces: [FoodPlace] = []
    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up table view and search bar
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        // Set up search bar
        searchBar.delegate = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearching ? filteredFoodPlaces.count : foodPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableViewCell
        let foodPlace = isSearching ? filteredFoodPlaces[indexPath.section] : foodPlaces[indexPath.section]
        
        cell.nameLabel.text = foodPlace.name
        cell.addressLabel.text = foodPlace.address
        cell.categoryLabel.text = foodPlace.category
        cell.foodImageView.image = foodPlace.image
        return cell
    }

    // MARK: - UITableViewDelegate (Optional)

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.foodPlace = isSearching ? filteredFoodPlaces[indexPath.section] : foodPlaces[indexPath.section]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredFoodPlaces.removeAll()
        } else {
            isSearching = true
            filteredFoodPlaces = foodPlaces.filter { foodPlace in
                return foodPlace.name.lowercased().contains(searchText.lowercased()) ||
                       foodPlace.address.lowercased().contains(searchText.lowercased()) ||
                       foodPlace.category.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset search and reload original data
        isSearching = false
        searchBar.text = ""
        filteredFoodPlaces.removeAll()
        tableView.reloadData()
        searchBar.resignFirstResponder()  // Dismiss the keyboard
    }

}

