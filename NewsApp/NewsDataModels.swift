//
//  NewsDataModels.swift
//  NewsApp
//
//  Created by Talip on 13.03.2023.
//

import Foundation

struct APIResponse: Codable {
    
    let articles: [Articles]
}

struct Articles: Codable {
    
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    
    let name: String
}
