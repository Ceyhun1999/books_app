import SwiftUI

struct BookDetailView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: BookViewModel
    let book: Book

    @Environment(\.dismiss) private var dismiss
    @State private var quantity = 1

    private var isFavorite: Bool {
        viewModel.isFavorite(book)
    }

    private var totalPrice: Double {
        book.finalPrice * Double(quantity)
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                cover
                titleRow

                RemoteImageView(imageURL: book.vendor.logoURL, contentMode: .fit)
                    .frame(height: 80)
                    .accessibilityLabel(book.vendor.title)

                Text(book.description)
                    .font(.system(size: 14))
                    .foregroundStyle(.textSecondary)

                reviewSection
                priceRow
                actionButtons
            }
            .padding(24)
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Subviews

    private var cover: some View {
        RemoteImageView(imageURL: book.coverImageURL)
            .frame(width: 237, height: 313)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(maxWidth: .infinity)
    }

    private var titleRow: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(book.title)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.textPrimary)

            Spacer()

            Button {
                viewModel.toggleFavorite(for: book)
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 20))
                    .foregroundStyle(.brandPurple)
                    .contentTransition(.symbolEffect(.replace))
            }
            .accessibilityLabel(isFavorite ? "Remove from favorites" : "Add to favorites")
        }
    }

    private var reviewSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Review")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.textPrimary)
                .accessibilityAddTraits(.isHeader)

            RatingView(rating: book.rating, showsValue: true)
        }
    }

    private var priceRow: some View {
        HStack {
            QuantitySelectorView(quantity: $quantity)

            Spacer()

            Text(totalPrice.priceText)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.brandPurple)
                .contentTransition(.numericText())
                .animation(.default, value: quantity)
        }
    }

    private var actionButtons: some View {
        HStack(spacing: 12) {
            Button("Continue shopping") {
                dismiss()
            }
            .buttonStyle(CapsuleButtonStyle())

            Button("View cart") {
                // Cart screen is not implemented yet.
            }
            .buttonStyle(CapsuleButtonStyle(isProminent: false))
        }
    }
}

// MARK: - Preview

#Preview {
    let viewModel = BookViewModel()

    NavigationStack {
        BookDetailView(viewModel: viewModel, book: viewModel.books[0])
    }
}
