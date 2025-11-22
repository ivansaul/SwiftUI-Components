import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders], content: {
                Section {
                    ForEach(1 ..< 10) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.gray.opacity(0.5))
                            .frame(height: 200)
                    }
                } header: {
                    header
                }

            })
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private var filters: some View {
        EmptyView()
    }
}

extension ContentView {
    private var header: some View {
        VStack {
            HStack {
                Image(systemName: "play.rectangle.fill")
                    .foregroundStyle(.red)
                    .font(.title2)

                Text("YouTube")
                    .font(.title2)
                    .bold()

                Spacer()

                Group {
                    Button(action: {}, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "bell")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                    })
                }
                .tint(.primary)
            }

            ScrollView(.horizontal) {
                LazyHStack(spacing: 10, content: {
                    ForEach(FILTERS, id: \.self) { filter in
                        Button(action: {}, label: {
                            Text(filter)
                                .font(.footnote)
                        })
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .tint(.primary)
                    }
                })
            }
        }
    }
}

let FILTERS: [String] = [
    "All",
    "Apple",
    "SwiftUI",
    "iOS",
    "Xcode",
    "Swift",
    "Dart",
    "Flutter",
]
