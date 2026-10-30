import SwiftUI

struct AuthorRowView: View {

    // MARK: - Properties

    let author: Author

    // MARK: - Body

    var body: some View {
        HStack(spacing: 10) {
            RemoteImageView(imageURL: author.imageURL)
                .frame(width: 68, height: 68)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text(author.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.textPrimary)

                Text(author.biography)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.textSecondary)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview

#Preview {
    AuthorRowView(author: Author.mockData[2])
        .padding(24)
}
