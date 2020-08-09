//
//  APIManager.swift
//  Breaking Bad character explorer app
//
//  Created by Emil Vaklinov on 31/07/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import Foundation
import UIKit

enum CharacterError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct APIManager {
    
    let resourceURL: URL
    
    init(characterName: String) {
        let resourceString = "https://breakingbadapi.com/api/characters?name=\(characterName)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getCharacters(completion: @escaping(Result<[Character], CharacterError>)-> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let charactersResponse = try decoder.decode(Character.self, from: jsonData)
                completion(.success([charactersResponse]))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
