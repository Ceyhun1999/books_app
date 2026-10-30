import Foundation

/// Every screen that can be pushed onto the main `NavigationStack`.
enum AppRoute: Hashable {
    case allBooks
    case allVendors
    case allAuthors
    case bookDetail(Book)
    case authorDetail(Author)
}
