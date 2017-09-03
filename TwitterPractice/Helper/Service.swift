//
//  Service.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 9/3/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import Foundation
struct Service {
    static let shared = Service()
    
    func fetchHomeFeed(completion: @escaping ([User], [Tweet]) -> Swift.Void) {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/twitter/home") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                // handle error
                return
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            if let fetchedData = try? decoder.decode(FetchedData.self, from: data) {
                DispatchQueue.main.async {
                    // pass passed obj here to main queue to update UI.
                    completion(fetchedData.users, fetchedData.tweets)
                }
            }
            }.resume()
    }
}
