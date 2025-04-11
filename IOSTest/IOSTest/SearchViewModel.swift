//
//  SearchViewModel.swift
//  IOSTest
//
//  Created by Smith Dias on 2025-04-11.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    //state variables
    @Published var query = ""
    @Published var places: [API] = []
    
    //api request
    func search() {
        guard let url = URL(string:"https://nominatim.openstreetmap.org/search?q=\(query)&format=json") else { return }
 
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                do {
                    self.places = try JSONDecoder().decode([API].self, from: data)
                } catch {
                    print("Failed:", error)
                }
            }
        }.resume()
    }
}


