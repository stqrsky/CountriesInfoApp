//
//  CountryTableViewCell.swift
//  CountriesInfoApp
//
//  Created by star on 11.02.22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!

    @IBOutlet weak var countryFlagImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        countryFlagImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
