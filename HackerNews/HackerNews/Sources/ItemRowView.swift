//
//  ItemRowView.swift
//  HackerNews
//
//  Created by @ivansaul on 7/28/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct ItemRowView: View {
    let title: String
    let footnote: String
    let score: Int
    let commentCount: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)

            Text(footnote)
                .foregroundStyle(.secondary)
                .font(.footnote)

            HStack {
                Label(score.formatted(), systemImage: "arrowtriangle.up.circle")
                    .foregroundStyle(.blue)

                Label(commentCount.formatted(), systemImage: "ellipses.bubble")
                    .foregroundStyle(.orange)
                    .padding(.leading, 20)
            }
            .font(.footnote)
            .labelStyle(.titleAndIcon)
        }
    }
}

extension ItemRowView {
    init(item: Item) {
        title = item.title
        score = item.score
        commentCount = item.commentCount
        footnote = (item.url.host() ?? "")
            + " - \(item.date.timeAgoString)"
            + " - by \(item.author) "
    }
}

#Preview {
    ItemRowView(
        title: "If buying isn't owning, piracy isn't stealing",
        footnote: "pluralistic.net - 3 days ago - by jay_kyburz",
        score: 1535,
        commentCount: 773
    )
}
