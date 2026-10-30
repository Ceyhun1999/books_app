import Combine
import Foundation

final class VendorViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var vendors = Vendor.mockData

    // MARK: - Queries

    func filteredVendors(by category: VendorCategory) -> [Vendor] {
        guard category != .all else {
            return vendors
        }

        return vendors.filter { $0.category == category }
    }
}
