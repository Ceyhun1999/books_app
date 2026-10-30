import SwiftUI

struct HomeView: View {

    // MARK: - Properties

    @StateObject private var bookViewModel = BookViewModel()
    @StateObject private var vendorViewModel = VendorViewModel()
    @StateObject private var authorViewModel = AuthorViewModel()

    @State private var path: [AppRoute] = []

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 15) {
                    SpecialOffersSectionView(books: bookViewModel.discountedBooks)
                        .padding(.horizontal, 24)

                    topOfWeekSection
                    bestVendorsSection
                    authorsSection
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: AppRoute.self, destination: destination)
        }
    }

    // MARK: - Sections

    private var topOfWeekSection: some View {
        VStack(spacing: 10) {
            SectionHeaderView(title: "Top of Week") {
                path.append(.allBooks)
            }

            horizontalList {
                ForEach(bookViewModel.books) { book in
                    NavigationLink(value: AppRoute.bookDetail(book)) {
                        BookCardView(book: book)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var bestVendorsSection: some View {
        VStack(spacing: 10) {
            SectionHeaderView(title: "Best Vendors") {
                path.append(.allVendors)
            }

            horizontalList {
                ForEach(vendorViewModel.vendors) { vendor in
                    VendorLogoView(logoURL: vendor.logoURL)
                }
            }
            .scrollClipDisabled()
        }
    }

    private var authorsSection: some View {
        VStack(spacing: 10) {
            SectionHeaderView(title: "Authors") {
                path.append(.allAuthors)
            }

            horizontalList {
                ForEach(authorViewModel.authors) { author in
                    NavigationLink(value: AppRoute.authorDetail(author)) {
                        AuthorCardView(author: author)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: - Helpers

    private func horizontalList<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                content()
            }
            .padding(.horizontal, 24)
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Navigation

    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .allBooks:
            AllBooksView(viewModel: bookViewModel)
        case .allVendors:
            AllVendorsView(viewModel: vendorViewModel)
        case .allAuthors:
            AllAuthorsView(viewModel: authorViewModel)
        case .bookDetail(let book):
            BookDetailView(viewModel: bookViewModel, book: book)
        case .authorDetail(let author):
            AuthorDetailView(bookViewModel: bookViewModel, author: author)
        }
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
