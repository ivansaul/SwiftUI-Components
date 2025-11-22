//
//  SwiftUIView.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct SwiftUIView: View {
    @State private var dx: CGFloat = 0
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.orange)
                .frame(height: 100)
                .offset(y: -20)
            
            

            ScrollView {
                GeometryReader { geo in
                    let width = geo.size.width
                    let height = geo.size.height
                    let x = geo.frame(in: .global).minX
                    let y = geo.frame(in: .global).minY
                    VStack {
                        Text("Width: \(width)")
                        Text("Height: \(height)")
                        Text("x: \(x)")
                        Text("y: \(y)")
                    }
                }
            }
            //        .frame(width: 300, height: 300)
            .border(Color.black)
        }
    }
}

#Preview {
    SwiftUIView()
}
