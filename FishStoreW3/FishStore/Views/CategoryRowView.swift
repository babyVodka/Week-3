import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories) { cat in
                    VStack {
                        Image(systemName: cat.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(12)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(Circle())
                        
                        Text(cat.name)
                            .font(.caption)
                    }
                    .frame(width: 80)
                }
            }
            .padding(.horizontal)
        }
    }
}
