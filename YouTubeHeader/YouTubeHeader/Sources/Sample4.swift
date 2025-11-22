//
//  Sample4.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct Sample4: View {
    let headerHeight: CGFloat = 100
    @State private var dY: CGFloat = 0
    @State private var lastDY: CGFloat = 0
    @State private var previousScrollOffset: CGFloat = 0
    @State private var currentScrollOffset: CGFloat = 0
    @State private var showHeader: Bool = true
    @State private var isScrollingDown: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        let y = geo.frame(in: .global).minY
                        dY = y
                        let offset = geo.frame(in: .global).minY
                        currentScrollOffset = offset
                        let delta = currentScrollOffset - previousScrollOffset

                        if delta > 1 {
                            isScrollingDown = true
                            // Scrolling down
                            withAnimation(.easeInOut) {
                                showHeader = true
                            }
                        } else if delta < -1 {
                            isScrollingDown = false
                            // Scrolling up
                            withAnimation(.easeInOut) {
                                showHeader = false
                            }
                        }
                        previousScrollOffset = offset
                    }
                    return Color.clear
                }
                .frame(height: 0)

                LazyVStack(content: {
                    ForEach(1 ... 50, id: \.self) { count in
                        Text("Placeholder \(count)")
                            .padding()
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                })
                .padding(.top, 100)
            }

            Rectangle()
                .fill(.orange.opacity(0.5))
                .frame(height: 100)
//                .offset(y: min(0, dY))
                .offset(y: dY.clamped(to: -100.0 ... 0.0))
//                .offset(y: showHeader ? 100 : 0)

            Text("\(dY)")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

            Text("\(isScrollingDown.description)")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Sample4()
}

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}
