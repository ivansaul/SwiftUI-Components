import SwiftUI

@MainActor
struct NewsView: View {
    @State private var vm: ViewModel = .init(dataService: DataService())
    var body: some View {
        NavigationStack {
            List(vm.items) { item in
                ItemRowView(item: item)
            }
            .navigationTitle("News")
            .listStyle(.plain)
            .task { await vm.fetchTopItems() }
        }
    }
}

#Preview {
    NewsView()
}
