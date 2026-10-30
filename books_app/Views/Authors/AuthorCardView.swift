import SwiftUI

struct AuthorCardView: View {

    // MARK: - Properties

    let author: Author

    // MARK: - Body

    var body: some View {
        VStack(spacing: 15) {
            RemoteImageView(imageURL: author.imageURL)
                .frame(width: 102, height: 102)
                .clipShape(Circle())

            VStack(spacing: 6) {
                Text(author.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.textPrimary)
                    .lineLimit(1)

                Text(author.jobTitle)
                    .font(.system(size: 14))
                    .foregroundStyle(.textSecondary)
                    .lineLimit(1)
            }
        }
        .frame(width: 130)
    }
}

// MARK: - Preview

#Preview {
    AuthorCardView(author: Author.mockData[0])
}
