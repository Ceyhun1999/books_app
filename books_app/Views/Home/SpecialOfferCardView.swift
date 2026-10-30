import SwiftUI

struct SpecialOfferCardView: View {

    // MARK: - Properties

    let book: Book

    // MARK: - Body

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 14) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Special Offer")
                        .font(.system(size: 20, weight: .bold))

                    Text("Discount \((book.discount ?? 0).formatted())%")
                        .font(.system(size: 14))
                }
                .foregroundStyle(.textPrimary)

                NavigationLink(value: AppRoute.bookDetail(book)) {
                    Text("Order now")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.brandPurple, in: Capsule())
                }
                .buttonStyle(.plain)
            }
            .padding(25)

            Spacer()

            RemoteImageView(imageURL: book.coverImageURL)
                .frame(width: 99, height: 145)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .frame(maxWidth: .infinity)
        .background(.offerBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        SpecialOfferCardView(book: Book.mockData[0])
            .padding(24)
    }
}
