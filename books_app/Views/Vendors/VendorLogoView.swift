import SwiftUI

struct VendorLogoView: View {

    // MARK: - Properties

    let logoURL: String
    /// Fixed tile width; `nil` stretches the tile to fill a grid column.
    var width: CGFloat? = 100

    // MARK: - Body

    var body: some View {
        RemoteImageView(imageURL: logoURL, contentMode: .fit)
            .frame(width: 65, height: 50)
            .frame(width: width, height: 100)
            .frame(maxWidth: width == nil ? .infinity : nil)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.cardBackground)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 4, y: 4)
            }
    }
}

// MARK: - Preview

#Preview {
    VendorLogoView(logoURL: Vendor.mockData[0].logoURL)
        .padding(24)
}
