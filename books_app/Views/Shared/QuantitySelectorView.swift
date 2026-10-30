import SwiftUI

struct QuantitySelectorView: View {

    // MARK: - Properties

    @Binding var quantity: Int
    var range: ClosedRange<Int> = 1...99

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            stepButton(
                systemImage: "minus",
                accessibilityLabel: "Decrease quantity",
                isProminent: false,
                isEnabled: quantity > range.lowerBound
            ) {
                quantity -= 1
            }

            Text("\(quantity)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.textPrimary)
                .monospacedDigit()
                .frame(minWidth: 24)
                .accessibilityLabel("Quantity \(quantity)")

            stepButton(
                systemImage: "plus",
                accessibilityLabel: "Increase quantity",
                isProminent: true,
                isEnabled: quantity < range.upperBound
            ) {
                quantity += 1
            }
        }
    }

    // MARK: - Subviews

    private func stepButton(
        systemImage: String,
        accessibilityLabel: String,
        isProminent: Bool,
        isEnabled: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(isProminent ? Color.white : Color.textSecondary)
                .frame(width: 32, height: 32)
                .background(isProminent ? Color.brandPurple : Color(.systemGray5), in: Circle())
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1 : 0.4)
        .accessibilityLabel(accessibilityLabel)
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var quantity = 1

    QuantitySelectorView(quantity: $quantity)
}
