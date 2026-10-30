import SwiftUI

struct EmptyStateView: View {

    // MARK: - Properties

    let title: String
    let message: String
    var systemImage = "magnifyingglass"

    // MARK: - Body

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: systemImage)
                .font(.system(size: 44))
                .foregroundStyle(.textSecondary)
                .accessibilityHidden(true)

            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.textPrimary)

            Text(message)
                .font(.system(size: 14))
                .foregroundStyle(.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.vertical, 60)
    }
}

// MARK: - Preview

#Preview {
    EmptyStateView(title: "No authors found", message: "Try another name or category")
}
