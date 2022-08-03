//
//  networkService.swift
//  Github public All Closed Pull Requests
//
//  Created by Admin on 02/08/22.
//


import Foundation

class networkService {
    
    typealias GitDataCompletion = ([gitRepositoryData]?, GitError?) -> ()
    
    func loadData(completion: @escaping GitDataCompletion) {
        guard let url = URL(string: "https://api.github.com/users/RajeshkumarGA/repos") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Failed request from github: \(error!.localizedDescription)")
                completion(nil, .failedRequest)
                return
            }
            
            guard let data = data else {
                print("No data returned from github")
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Unable to process github response")
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                print("Failure response from github: \(response.statusCode)")
                completion(nil, .failedRequest)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode([gitRepositoryData].self, from: data)
                completion(response, nil)
                
            } catch {
                
                print(error)
            }
        }.resume()
    }
}

