//
//  DataService.swift
//  HackerNews
//
//  Created by @ivansaul on 7/28/25.
//
//  https://github.com/ivansaul
//

import Foundation

protocol DataServiceProtocol {
    func fetchStory(byId id: Int) async throws -> Item
    func fetchTopStories() async throws -> [Item]
}

class DataService: DataServiceProtocol {
    func fetchStory(byId id: Int) async throws -> Item {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")
        guard let url else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(Item.self, from: data)
    }

    func fetchTopStories() async throws -> [Item] {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/beststories.json")
        guard let url else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        let ids = try JSONDecoder().decode([Int].self, from: data)
        return try await withThrowingTaskGroup(of: Item.self) { group in
            var items: [Item] = []
            for id in ids.prefix(10) {
                group.addTask { try await self.fetchStory(byId: id) }
            }
            for try await item in group {
                items.append(item)
            }
            return items
        }
    }
}
