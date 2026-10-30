import SwiftUI

struct RatingView: View {

    // MARK: - Properties

    let rating: Double
    var showsValue = false

    private let maxRating = 5

    // MARK: - Body

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(Double(index) <= rating ? Color.yellow : Color.textPrimary)
            }

            if showsValue {
                Text(String(format: "(%.1f)", rating))
                    .font(.system(size: 14))
                    .foregroundStyle(.textPrimary)
                    .padding(.leading, 4)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating \(rating.formatted()) out of \(maxRating)")
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        RatingView(rating: 4)
        RatingView(rating: 4, showsValue: true)
    }
}
