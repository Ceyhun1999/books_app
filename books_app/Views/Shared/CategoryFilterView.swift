import SwiftUI

struct CategoryFilterView<Category>: View
where Category: CaseIterable & Hashable & RawRepresentable, Category.RawValue == String {

    // MARK: - Properties

    @Binding var selectedCategory: Category

    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 24) {
                ForEach(Array(Category.allCases), id: \.self) { category in
                    categoryButton(for: category)
                }
            }
            .padding(.horizontal, 24)
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Subviews

    private func categoryButton(for category: Category) -> some View {
        let isSelected = selectedCategory == category

        return Button {
            selectedCategory = category
        } label: {
            Text(category.rawValue)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(isSelected ? Color.brandPurple : Color.textSecondary)
                .padding(.bottom, 8)
                .overlay(alignment: .bottom) {
                    if isSelected {
                        Rectangle()
                            .fill(.brandPurple)
                            .frame(height: 2)
                    }
                }
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var category = AuthorCategory.all

    CategoryFilterView(selectedCategory: $category)
}
