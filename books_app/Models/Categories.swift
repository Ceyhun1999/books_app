import Foundation

// MARK: - Author Category

enum AuthorCategory: String, CaseIterable, Hashable {
    case all = "All"
    case poets = "Poets"
    case playwrights = "Playwrights"
    case novelists = "Novelists"
    case journalists = "Journalists"
    case writers = "Writers"
}

// MARK: - Vendor Category

enum VendorCategory: String, CaseIterable, Hashable {
    case all = "All"
    case books = "Books"
    case poems = "Poems"
    case stationery = "Stationery"
    case other = "Other"
}
