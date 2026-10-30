import SwiftUI

struct AllAuthorsView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: AuthorViewModel

    @State private var searchText = ""
    @State private var selectedCategory: AuthorCategory = .all

    private var filteredAuthors: [Author] {
        viewModel.filteredAuthors(by: selectedCategory, searchText: searchText)
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            PageHeaderView(caption: "Check the authors", title: "Authors")

            CategoryFilterView(selectedCategory: $selectedCategory)

            if filteredAuthors.isEmpty {
                EmptyStateView(title: "No authors found", message: "Try another name or category")
            } else {
                authorsList
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Authors")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Search authors")
    }

    // MARK: - Subviews

    private var authorsList: some View {
        LazyVStack(spacing: 30) {
            ForEach(filteredAuthors) { author in
                NavigationLink(value: AppRoute.authorDetail(author)) {
                    AuthorRowView(author: author)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AllAuthorsView(viewModel: AuthorViewModel())
    }
}
