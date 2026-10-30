import SwiftUI

struct VendorCardView: View {

    // MARK: - Properties

    let vendor: Vendor
    var width: CGFloat? = 100

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VendorLogoView(logoURL: vendor.logoURL, width: width)

            Text(vendor.title)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.textPrimary)
                .lineLimit(1)

            RatingView(rating: vendor.rating)
        }
    }
}

// MARK: - Preview

#Preview {
    VendorCardView(vendor: Vendor.mockData[0])
        .padding(24)
}
