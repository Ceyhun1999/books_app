import SwiftUI

struct BookCardView: View {

    // MARK: - Properties

    let book: Book
    /// Fixed card width; `nil` stretches the card to fill a grid column.
    var width: CGFloat? = 130
    var coverHeight: CGFloat = 160

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            cover
            details
        }
        .frame(width: width)
        .frame(maxWidth: width == nil ? .infinity : nil, alignment: .leading)
    }

    // MARK: - Subviews

    private var cover: some View {
        Color.clear
            .frame(maxWidth: .infinity)
            .frame(height: coverHeight)
            .overlay {
                RemoteImageView(imageURL: book.coverImageURL)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private var details: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(book.title)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.textPrimary)
                .lineLimit(1)

            HStack(spacing: 8) {
                Text(book.finalPrice.priceText)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.brandPurple)

                if book.hasDiscount {
                    Text(book.price.priceText)
                        .font(.system(size: 12))
                        .foregroundStyle(.textSecondary)
                        .strikethrough()
                        .accessibilityLabel("Old price \(book.price.priceText)")
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    HStack(alignment: .top, spacing: 10) {
        BookCardView(book: Book.mockData[0])
        BookCardView(book: Book.mockData[1])
    }
    .padding(24)
}
