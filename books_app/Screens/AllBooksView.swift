import SwiftUI

struct AllBooksView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: BookViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible()),
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.books) { book in
                    NavigationLink(value: AppRoute.bookDetail(book)) {
                        BookCardView(book: book, width: nil, coverHeight: 250)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .scrollIndicators(.hidden)
        .navigationTitle("All books")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AllBooksView(viewModel: BookViewModel())
    }
}
