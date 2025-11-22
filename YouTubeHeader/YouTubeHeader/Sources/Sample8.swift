//
//  Sample8.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct LocalVsGlobal: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                ForEach(0 ..< 10) { _ in
                    GeometryReader { geo in
                        let localY = geo.frame(in: .local).minY
                        let globalY = geo.frame(in: .global).minY

                        VStack {
                            Text("Local Y: \(Int(localY))")
                            Text("Global Y: \(Int(globalY))")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.orange.opacity(0.3))
                        .cornerRadius(8)
                    }
                    .frame(height: 100)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    LocalVsGlobal()
}
