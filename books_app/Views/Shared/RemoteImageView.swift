import SDWebImageSwiftUI
import SwiftUI

struct RemoteImageView: View {

    // MARK: - Properties

    let imageURL: String
    var contentMode: ContentMode = .fill

    // MARK: - Body

    var body: some View {
        WebImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } placeholder: {
            ProgressView()
        }
    }
}

// MARK: - Preview

#Preview {
    RemoteImageView(imageURL: Book.mockData[0].coverImageURL)
        .frame(width: 150, height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 12))
}
