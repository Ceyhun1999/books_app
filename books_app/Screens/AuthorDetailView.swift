import SwiftUI

struct AuthorDetailView: View {

    // MARK: - Properties

    @ObservedObject var bookViewModel: BookViewModel
    let author: Author

    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible()),
    ]

    private var products: [Book] {
        bookViewModel.books(by: author)
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                aboutSection
                productsSection
            }
            .padding(24)
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Authors")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Subviews

    private var header: some View {
        VStack(spacing: 8) {
            RemoteImageView(imageURL: author.imageURL)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.bottom, 4)
                .accessibilityHidden(true)

            Text(author.jobTitle)
                .font(.system(size: 14))
                .foregroundStyle(.textPrimary)

            Text(author.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.textPrimary)
                .accessibilityAddTraits(.isHeader)

            RatingView(rating: author.rating, showsValue: true)
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
    }

    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            sectionTitle("About")

            Text(author.biography)
                .font(.system(size: 14))
                .foregroundStyle(.textSecondary)
                .lineSpacing(4)
        }
    }

    private var productsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Products")

            if products.isEmpty {
                EmptyStateView(
                    title: "No products yet",
                    message: "Books by \(author.name) will appear here",
                    systemImage: "book.closed"
                )
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(products) { book in
                        NavigationLink(value: AppRoute.bookDetail(book)) {
                            BookCardView(book: book, width: nil, coverHeight: 128)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    // MARK: - Helpers

    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.textPrimary)
            .accessibilityAddTraits(.isHeader)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AuthorDetailView(bookViewModel: BookViewModel(), author: Author.mockData[2])
    }
}
