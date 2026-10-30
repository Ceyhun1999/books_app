import Foundation

extension Double {

    /// Price in the "$19.99" format used across the app.
    var priceText: String {
        String(format: "$%.2f", self)
    }
}
