//
//  Service.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 19.01.2023.
//

import Foundation

final class Service {
    
    private let apiKey = "82576BD7-872F-4446-985F-DAF31A8AFEDD"

    // singleton
    static let shared = Service()
    private init() {}
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchCurrencyList(completion: @escaping ([Currency]?, Error?) -> Void) {
        let urlString = "https://rest.coinapi.io/v1/assets/icons/32?apikey=\(apiKey)"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, err in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let objects = try self.decoder.decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print("Failed to decode: ", error)
            }
        }.resume()
    }
    
}
