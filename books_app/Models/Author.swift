import Foundation

struct Author: Identifiable, Hashable {

    // MARK: - Properties

    let id = UUID()
    let name: String
    let jobTitle: String
    let imageURL: String
    let biography: String
    let rating: Double
    let category: AuthorCategory
}
