import Foundation

struct Vendor: Identifiable, Hashable {

    // MARK: - Properties

    let id = UUID()
    let title: String
    let logoURL: String
    let rating: Double
    let category: VendorCategory
}
