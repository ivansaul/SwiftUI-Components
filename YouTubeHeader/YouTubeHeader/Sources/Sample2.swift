//
//  Sample2.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct FloatingHeaderOnScrollView: View {
    @State private var previousScrollOffset: CGFloat = 0
    @State private var currentScrollOffset: CGFloat = 0
    @State private var showHeader: Bool = true

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                GeometryReader { geo -> Color in
                    // Track scroll offset
                    DispatchQueue.main.async {
                        let offset = geo.frame(in: .global).minY
                        currentScrollOffset = offset
                        let delta = currentScrollOffset - previousScrollOffset

                        if delta > 10 {
                            // Scrolling down
                            withAnimation(.easeInOut) {
                                showHeader = false
                            }
                        } else if delta < -10 {
                            // Scrolling up
                            withAnimation(.easeInOut) {
                                showHeader = true
                            }
                        }

                        previousScrollOffset = offset
                    }
                    return Color.clear
                }
                .frame(height: 0) // Invisible tracker at top

                LazyVStack(spacing: 16) {
                    ForEach(1 ... 50, id: \.self) { index in
                        Text("Item \(index)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 60) // Leave space for header
            }

            if showHeader {
                HeaderView()
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .edgesIgnoringSafeArea(.top)
    }

    @ViewBuilder
    private func HeaderView() -> some View {
        ZStack {
            Color.blue
            Text("Floating Header")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .shadow(radius: 4)
    }
}

#Preview {
    FloatingHeaderOnScrollView()
}
