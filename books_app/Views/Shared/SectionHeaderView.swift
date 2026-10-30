import SwiftUI

struct SectionHeaderView: View {

    // MARK: - Properties

    let title: String
    let onSeeAll: () -> Void

    // MARK: - Body

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.textPrimary)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            Button("See all", action: onSeeAll)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.brandPurple)
        }
        .padding(24)
    }
}

// MARK: - Preview

#Preview {
    SectionHeaderView(title: "Top of Week") {}
}
