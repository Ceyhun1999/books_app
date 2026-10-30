import Foundation

struct Book: Identifiable, Hashable {

    // MARK: - Properties

    let id = UUID()
    let title: String
    let description: String
    let coverImageURL: String
    let price: Double
    let discount: Double?
    let rating: Double
    var isFavorite = false
    let author: Author
    let vendor: Vendor
}

// MARK: - Computed Properties

extension Book {

    var hasDiscount: Bool {
        (discount ?? 0) > 0
    }

    var finalPrice: Double {
        guard let discount else {
            return price
        }

        return price * (1 - discount / 100)
    }
}
