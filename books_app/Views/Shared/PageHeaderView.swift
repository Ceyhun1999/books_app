import SwiftUI

struct PageHeaderView: View {

    // MARK: - Properties

    let caption: String
    let title: String

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text(caption)
                .font(.system(size: 16))
                .foregroundStyle(.textSecondary)

            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.brandPurple)
                .accessibilityAddTraits(.isHeader)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
    }
}

// MARK: - Preview

#Preview {
    PageHeaderView(caption: "Check the authors", title: "Authors")
}
