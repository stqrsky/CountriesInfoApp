//
//  Bundle+Ext.swift
//  CountriesInfoApp
//
//  Created by star on 12.02.22.
//

import Foundation

extension Bundle {
    
    
    /// Diese Methode kann für das Laden einer JSON-Datei aus dem lokalem Bundle verwendet werden.
    ///
    /// Die Methode kann jede Art von JSON-Struktur in einen entsprechenden Swift-Datentypen dekodieren. Der gewünschte Swift-Datentyp wird dabei implizit aus dem Rückgabewert der Methode abgeleitet. Daraus folgt, dass beim Aufruf dieser Methode der Datentyp des Ausdruckes, welcher den Rückgabewert zugewiesen bekommt, eindeutig festgelegt sein muss.
    ///
    /// # Hinweis
    /// Sollte es während dem Dekodieren des JSON-Datei zu einem unerwarteten Fehler kommen, so wird ein `fatalError` ausgelöst. Somit ist eine weitere Programm-Ausführung nicht mehr möglich.
    ///
    /// # Verwendung
    /// ```
    /// let countries: [Country] = Bundle.main.decode("countries.json")//Beispiel
    /// ```
    ///
    /// - Parameter fileName: Der Dateiname der JSON-Datei, die dekodiert werden soll. **WICHTIG**: Die Endung .json muss mit angegeben werden.
    ///
    /// - Returns: Gibt die dekodierten JSON-Daten in dem angegebenen Swift -Datentyp zurück.
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
