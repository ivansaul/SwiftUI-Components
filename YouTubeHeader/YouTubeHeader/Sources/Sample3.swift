//
//  Sample3.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct Sample3: View {
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                let y = geo.frame(in: .global).minY
                let offsetY = max(0, y)
                Rectangle()
                    .fill(.pink)
                    .frame(height: 250 + offsetY)
                    .offset(y: -offsetY)
                    .border(Color.black)
                    .overlay(alignment: .bottom) {
                        Text("\(y)")
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Sample3()
}
