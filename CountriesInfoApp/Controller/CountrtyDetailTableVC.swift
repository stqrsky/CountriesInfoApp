//
//  CountryDetailTableVCTableViewController.swift
//  CountriesInfoApp
//
//  Created by star on 11.02.22.
//

import UIKit

class CountryDetailTableVC: UITableViewController {

    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryInhabitants: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryCurrency: UILabel!
    
    
    var country: CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        countryNameLabel.text = country?.countryName
        countryFlagImage.image = UIImage(named: country?.imageName ?? "DefaultImage")
        countryFlagImage.layer.borderWidth = 1
        
        countryInhabitants.text = country?.inhabitants
        countryCapital.text = country?.capital
        countryCurrency.text = country?.currency
    }
    
}
