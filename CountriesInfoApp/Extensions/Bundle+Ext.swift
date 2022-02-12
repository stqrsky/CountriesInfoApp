//
//  Bundle+Ext.swift
//  CountriesInfoApp
//
//  Created by star on 12.02.22.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("File could not be found in Bundle.")
        }
        
        guard let data   = try? Data(contentsOf: url) else {
            fatalError("File could not be loaded.")
        }
        
        guard let objects = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Decoding failure.")
        }
        
        return objects
    }
}
