import Combine
import Foundation

final class AuthorViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var authors = Author.mockData

    // MARK: - Queries

    func filteredAuthors(by category: AuthorCategory, searchText: String) -> [Author] {
        authors.filter { author in
            let matchesCategory = category == .all || author.category == category
            let matchesSearch = searchText.isEmpty || author.name.localizedCaseInsensitiveContains(searchText)

            return matchesCategory && matchesSearch
        }
    }
}
