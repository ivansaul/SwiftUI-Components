//
//  Extensions.swift
//  HackerNews
//
//  Created by @ivansaul on 7/28/25.
//
//  https://github.com/ivansaul
//

import Foundation

extension Date {
    var timeAgoString: String {
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .full // .abbreviated  .short
//        return formatter.localizedString(for: self, relativeTo: Date())
        formatted(.relative(presentation: .numeric))
    }
}
