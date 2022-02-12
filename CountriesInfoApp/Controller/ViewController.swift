//
//  ViewController.swift
//  CountriesInfoApp
//
//  Created by star on 11.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var filteredCountries = countryData
    let countries = countryData
    var selectedCountry: CountryModel?
    
    //MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // let data = ["Deutschland", "Philippinen", "Frankreich", "Dänemark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tableView.keyboardDismissMode = .onDrag
        
        tableView.rowHeight  = 100
    }

    // loading right country, when Segue is performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let zielTVC = segue.destination as! CountryDetailTableVC
            zielTVC.country = selectedCountry
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = countries[indexPath.row]
        // Flag tapped, to perform the Segue connection to show country detail
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        cell.countryNameLabel.text = countries[indexPath.row].countryName
        cell.countryFlagImage.image = UIImage(named: countries[indexPath.row].imageName)
        
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchText = searchText.lowercased()
        
        filteredCountries = countries.filter({ country in
            if country.countryName.lowercased().contains(searchText) {
                return true
            }
            return false
        })
        
        
    }
}
