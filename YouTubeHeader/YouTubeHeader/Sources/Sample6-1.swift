//
//  Sample6-1.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

import SwiftUI

struct Sample61: View {
    @State private var offset: CGFloat = 0
    @State private var showHeader: Bool = false
    @State private var scale: CGFloat = 1

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
//                Rectangle()
//                    .fill(.orange)
                imageView
                    .frame(height: 300 + max(offset, 0))
                    .frame(maxWidth: .infinity)
                    .scaleEffect(scale)
                    .clipped()
                    .padding(.top, -max(offset, 0))
                    .border(Color.black)
                    .background {
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                offset = geo.frame(in: .global).minY
                                withAnimation(.bouncy) {
                                    showHeader = offset < -150 ? true : false
                                    if offset > 0 {
                                        scale = 1 + offset / 300
                                    } else {
                                        scale = 1
                                    }
                                }
                            }
                            return Color.clear
                        }
                    }
                    .overlay {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(scale)
                            .foregroundStyle(.white)
                    }

                LazyVStack {
                    ForEach(1 ... 50, id: \.self) { count in
                        cardRow
                            .overlay {
                                Text("\(count)")
                                    .bold()
                            }
                    }
                }
                .border(Color.black)
            }

            if showHeader {
                Rectangle()
                    .fill(.pink)
                    .frame(height: 150)
            }

            // Solo para debug
            Text(String(format: "%.1f", offset))
                .padding()
                .background(.black.opacity(0.5))
                .foregroundStyle(.white)
                .cornerRadius(8)
                .padding(.top, 50)
        }
        .ignoresSafeArea()
    }

    private var cardRow: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray.opacity(0.7))
            .frame(height: 130)
            .padding(.horizontal)
    }

    private var imageView: some View {
        let url = "https://random-image-pepebigotes.vercel.app/api/random-image"
        return AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    Sample61()
}
