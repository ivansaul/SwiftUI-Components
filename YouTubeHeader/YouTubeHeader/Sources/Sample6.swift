//
//  Sample6.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct Sample6: View {
    @State private var offset: CGFloat = 0
    @State private var showHeader: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        offset = geo.frame(in: .global).minY
                        withAnimation(.bouncy) {
                            showHeader = offset < -150 ? true : false
                        }
                    }
                    return Color.clear
                }
                .frame(height: 0)

//                GeometryReader { geo in
//                    let y = geo.frame(in: .global).minY
//                    let isScrollDown = y > 0 ? true : false
//                    Rectangle()
//                        .fill(.orange)
//                        .frame(height: 300 + (isScrollDown ? y : 0))
//                        .offset(y: isScrollDown ? -y : 0)
//                        .overlay(alignment: .bottom) {
//                            Text("\(y)")
//                        }
//                }
//                .frame(height: 300)
//                .border(Color.black)

                Rectangle()
                    .fill(.orange)
                    .frame(height: 300 + max(offset, 0))
//                    .offset(y: -max(offset, 0))
                    .padding(.top, -max(offset, 0))
                    .border(Color.black)

                LazyVStack(content: {
                    ForEach(1 ... 50, id: \.self) { count in
                        cardRow
                            .overlay {
                                Text("\(count)")
                                    .bold()
                            }
                    }
                })
                .border(Color.black)
            }

            if showHeader {
                Rectangle()
                    .fill(.pink)
                    .frame(height: 150)
            }

            Text("\(offset)")
                .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Sample6()
}

extension Sample6 {
    private var cardRow: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray.opacity(0.7))
            .frame(height: 130)
            .padding(.horizontal)
    }
}
