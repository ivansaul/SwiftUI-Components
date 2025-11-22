//
//  ViewModel.swift
//  HackerNews
//
//  Created by @ivansaul on 7/28/25.
//
//  https://github.com/ivansaul
//

import Foundation

@Observable @MainActor
final class ViewModel {
    private(set) var isLoading: Bool = false
    private(set) var items: [Item] = []

    private let dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }

    func fetchTopItems() async {
        if isLoading { return }
        defer { isLoading = false }
        isLoading = true
        do {
            items = try await dataService.fetchTopStories()
        } catch {
            print(error)
        }
    }
}
