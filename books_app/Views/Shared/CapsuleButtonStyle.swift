import SwiftUI

/// Full-width capsule button: filled purple when prominent, tinted otherwise.
struct CapsuleButtonStyle: ButtonStyle {

    // MARK: - Properties

    var isProminent = true

    // MARK: - Body

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(isProminent ? Color.white : Color.brandPurple)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(isProminent ? Color.brandPurple : Color.brandPurple.opacity(0.05), in: Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

// MARK: - Preview

#Preview {
    HStack(spacing: 12) {
        Button("Continue shopping") {}
            .buttonStyle(CapsuleButtonStyle())

        Button("View cart") {}
            .buttonStyle(CapsuleButtonStyle(isProminent: false))
    }
    .padding(24)
}
