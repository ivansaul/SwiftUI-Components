//
//  PPPP.swift
//  YouTubeHeader
//
//  Created by @ivansaul on 8/5/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct PPPP: View {
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .border(Color.black)
                .padding(.top, -50)
                .border(.yellow)

            Rectangle()
                .fill(.orange.opacity(0.5))
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    PPPP()
}
