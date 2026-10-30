import SwiftUI

struct AllVendorsView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: VendorViewModel

    @State private var selectedCategory: VendorCategory = .all

    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible()),
    ]

    private var filteredVendors: [Vendor] {
        viewModel.filteredVendors(by: selectedCategory)
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            PageHeaderView(caption: "Our Vendors", title: "Vendors")

            CategoryFilterView(selectedCategory: $selectedCategory)

            if filteredVendors.isEmpty {
                EmptyStateView(title: "No vendors found", message: "Try another category")
            } else {
                vendorsGrid
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Vendors")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Subviews

    private var vendorsGrid: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(filteredVendors) { vendor in
                VendorCardView(vendor: vendor, width: nil)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AllVendorsView(viewModel: VendorViewModel())
    }
}
