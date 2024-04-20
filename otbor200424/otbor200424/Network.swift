//
//  Network.swift
//  otbor200424
//
//  Created by Dariya on 20/4/24.
//

import Foundation

struct Network {
    private let baseURL = URL(string: "https://rickandmortyapi.com/api")!
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    func fetchProducts(completion: @escaping (Result<[ItemPerson], Error>) -> Void) {
        let request = URLRequest(url: baseURL)
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            print("Response is: ---------------------------- \n\(response) \n ----------------------------")
            if let error {
                completion(.failure(error))
            }
            if let data {
                do {
                    let products = try decoder.decode(Item.self, from: data).allItem
                    completion(.success(products))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        urlSession.resume()
    }
}
