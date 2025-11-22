//
//  Sample7.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

import SwiftUI

struct MultipleCoordinateSpacesView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Scroll A")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue.opacity(0.2))

            ScrollView {
                GeometryReader { geo in
                    let y = geo.frame(in: .named("scrollA")).minY
                    Rectangle()
                        .fill(.red)
                        .frame(height: 200 + max(y, 0))
                        .offset(y: -max(y, 0))
                        .overlay(Text("Header A: \(Int(y))").foregroundColor(.white))
                }
                .frame(height: 200)

                LazyVStack(spacing: 12) {
                    ForEach(0 ..< 20) { i in
                        Text("A - Item \(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
            }
            .coordinateSpace(name: "scrollA")
            .frame(height: 300) // cada scroll ocupa la mitad

            Divider()

            Text("Scroll B")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green.opacity(0.2))

            ScrollView {
                GeometryReader { geo in
                    let y = geo.frame(in: .named("scrollB")).minY
                    Rectangle()
                        .fill(.green)
                        .frame(height: 150 + max(y, 0))
                        .offset(y: -max(y, 0))
                        .overlay(Text("Header B: \(Int(y))").foregroundColor(.white))
                }
                .frame(height: 150)

                LazyVStack(spacing: 12) {
                    ForEach(0 ..< 20) { i in
                        Text("B - Item \(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
            }
            .coordinateSpace(name: "scrollB")
            .frame(height: 300) // cada scroll ocupa la mitad
        }
    }
}

#Preview {
    MultipleCoordinateSpacesView()
}
