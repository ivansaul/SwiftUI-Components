//
//  Sample1.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct CollapsingHeaderScrollView: View {
    @State private var offset: CGFloat = 0

    var body: some View {
        ScrollView {
            GeometryReader { geo in
                let minY = geo.frame(in: .global).minY

                ZStack {
//                    Image("header_image")
//                        .resizable()
                    Rectangle()
                        .fill(.gray)
                        .scaledToFill()
                        .frame(height: max(200 - minY, 60)) // Collapsing effect
                        .clipped()

                    VStack {
                        Spacer()
                        Text("Floating Header")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    .frame(height: max(200 - minY, 60))
                }
                .frame(height: 200)
                .offset(y: minY < 0 ? minY : 0) // Stick to top
            }
            .frame(height: 200)

            // Scrollable content
            LazyVStack {
                ForEach(1 ..< 30) { index in
                    Text("Item \(index)")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top, 5)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    CollapsingHeaderScrollView()
}
