import SwiftUI

struct SpecialOffersSectionView: View {

    // MARK: - Properties

    let books: [Book]

    @State private var selectedPage = 0

    // MARK: - Body

    var body: some View {
        VStack(spacing: 12) {
            TabView(selection: $selectedPage) {
                ForEach(Array(books.enumerated()), id: \.element.id) { index, book in
                    SpecialOfferCardView(book: book)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 150)

            pageIndicator
        }
    }

    // MARK: - Subviews

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(books.indices, id: \.self) { index in
                let isSelected = selectedPage == index

                Button {
                    withAnimation {
                        selectedPage = index
                    }
                } label: {
                    Capsule()
                        .fill(isSelected ? Color.brandPurple : Color.gray.opacity(0.3))
                        .frame(width: isSelected ? 20 : 8, height: 8)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Offer \(index + 1) of \(books.count)")
                .accessibilityAddTraits(isSelected ? .isSelected : [])
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        SpecialOffersSectionView(books: Book.mockData.filter(\.hasDiscount))
            .padding(24)
    }
}
