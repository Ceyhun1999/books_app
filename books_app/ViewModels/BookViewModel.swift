import Combine
import Foundation

final class BookViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var books = Book.mockData

    var discountedBooks: [Book] {
        books.filter(\.hasDiscount)
    }

    // MARK: - Queries

    func books(by author: Author) -> [Book] {
        books.filter { $0.author.id == author.id }
    }

    /// Reads the current state from `books`, not from a copy a screen may hold.
    func isFavorite(_ book: Book) -> Bool {
        books.first { $0.id == book.id }?.isFavorite ?? false
    }

    // MARK: - Actions

    func toggleFavorite(for book: Book) {
        guard let index = books.firstIndex(where: { $0.id == book.id }) else {
            return
        }

        books[index].isFavorite.toggle()
    }
}
