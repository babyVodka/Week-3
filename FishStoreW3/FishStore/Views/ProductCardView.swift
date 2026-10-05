import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                
                Image(systemName: "heart")
                    .padding(6)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(6)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text("\(Int(product.price))đ")
                    .font(.caption)
                    .foregroundColor(.red)
                    .bold()
            }
            .padding(8)
        }
        .frame(width: 120)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
