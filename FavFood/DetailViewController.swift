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
        setupUI()
    }
    
    private func setupUI() {
        guard let foodPlace = foodPlace else { return }
        foodImageView.image = foodPlace.image
        nameLabel.text = foodPlace.name
        categoryLabel.text = foodPlace.category
        descriptionLabel.text = """
        An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.
        """
        addressLabel.text = foodPlace.address
        phoneLabel.text = "983-284334" // Use actual phone number if available in `FoodPlace` data
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
