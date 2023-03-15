//
//  APICaller.swift
//  NewsApp
//
//  Created by Talip on 13.03.2023.
//

import Foundation


final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7a1a9152303a48838762880686feca87")
        
        static let searchBarUrlString = "https://newsapi.org/v2/everything?sortedBy=popularity&apiKey=7a1a9152303a48838762880686feca87&q="
    }
    
    init() {}
    
    public func getTopStroies(completion: @escaping (Result<[Articles], Error>) -> Void) {
        
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func searchBar(with query: String, completion: @escaping (Result<[Articles], Error>) -> Void) {
        
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchBarUrlString + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
