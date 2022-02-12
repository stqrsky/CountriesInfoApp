//
//  Bundle+Ext.swift
//  CountriesInfoApp
//
//  Created by star on 12.02.22.
//

import Foundation

extension Bundle {
    func decodeCountryModelObjects() -> [CountryModel] {
        guard let url = self.url(forResource: "data", withExtension: "json") else {
            fatalError("File could not be found in Bundle.")
        }
        
        guard let data   = try? Data(contentsOf: url) else {
            fatalError("File could not be loaded.")
        }
        
        guard let countryModelObjects = try? JSONDecoder().decode([CountryModel].self, from: data) else {
            fatalError("Decoding failure.")
        }
        
        return countryModelObjects
    }
}
