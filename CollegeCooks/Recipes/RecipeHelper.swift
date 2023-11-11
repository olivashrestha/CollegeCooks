//
//  RecipeHelper.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import Foundation

class RecipeHelper{
    
let fmpUrl = "https://api.spoonacular.com/recipes/random?"

    private func fmpUrl(parameters: [String: String]) -> URL? {
        var queryItems = [URLQueryItem]()

        // Manually add the apiKey parameter first
        if let apiKey = parameters["apiKey"] {
            let apiKeyItem = URLQueryItem(name: "apiKey", value: apiKey)
            queryItems.append(apiKeyItem)
        }

        // Add other parameters except apiKey
        for (key, value) in parameters {
            if key != "apiKey" {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }

        guard var components = URLComponents(string: fmpUrl) else { return nil }
        components.queryItems = queryItems
        return components.url
    }

    func fetch(cuisine: String, type: String, word: String, time: String
    ) async throws -> Profile{
        print("cuisine: \(cuisine)")
        print("type: \(type)")
        print("word: \(word)")
        print("time: \(time)")

    
        let params = ["apiKey": Constants.apikey, "cuisine": cuisine, "type": type, "tags": word, "maxReadyTime": time]
        guard let url = fmpUrl(parameters: params) else { throw URLError.BadURL }
        print("url: \(url)")
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError.BadURL }
        
       let decoder = JSONDecoder()
        let recipe = try decoder.decode(Profile.self, from: data)
        return recipe

}
}


