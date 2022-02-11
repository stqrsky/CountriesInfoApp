//
//  Data.swift
//  CountriesInfoApp
//
//  Created by star on 11.02.22.
//

import Foundation

let countryData = loadData()

func loadData() -> [CountryModel] {
    var data: Data
    
    // local access to the data
    guard let file = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("Error")
    }
    
    data = try! Data(contentsOf: file)
    let decoder = JSONDecoder()
    return try! decoder.decode([CountryModel].self, from: data)
    
}
