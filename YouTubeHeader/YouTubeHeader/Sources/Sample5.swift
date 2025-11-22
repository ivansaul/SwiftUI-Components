//
//  Sample5.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct Sample5: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(content: {
                ForEach(1 ... 10, id: \.self) { count in
                    GeometryReader { geo in
                        let y = geo.frame(in: .global).minX
                        Rectangle()
                            .fill(.gray)
                            .overlay {
                                Text("\(count) -> \(y)")
                            }
                    }
                    .frame(width: 100, height: 100)
                }

            })
        }
    }
}

#Preview {
    Sample5()
}
