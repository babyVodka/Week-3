import SwiftUI

struct ContentView: View {
    // 1. Tạo dữ liệu mẫu cho danh mục (categories)
    let sampleCategories = [
        ProductCategory(name: "Cá cảnh", iconName: "fish"),
        ProductCategory(name: "Cây thủy sinh", iconName: "leaf"),
        ProductCategory(name: "Phụ kiện bể", iconName: "gearshape"),
        ProductCategory(name: "Thiết bị lọc", iconName: "line.3.horizontal.decrease.circle")
    ]
    
    // 2. Tạo dữ liệu mẫu cho sản phẩm (product)
    let sampleProduct = Product(
        name: "Cá Neon Tetra",
        categoryId: UUID(),
        price: 20000,
        imageName: "fish.fill",
        description: "Cá neon màu sắc rực rỡ, dễ nuôi",
        stock: 50
    )
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HomeHeader(
                        storeName: "Ca Canh Xinh",
                        subtitle: "Khong xinh bang em"
                    )
                    
                    SearchBarView()
                    
                    BannerView()
                    
                    // Truyền dữ liệu sampleCategories vào CategoryRowView
                    CategoryRowView(categories: sampleCategories)
                    
                    // Truyền dữ liệu sampleProduct vào ProductCardView
                    ProductCardView(product: sampleProduct)
                }
            }
            .navigationTitle("Ca Canh xinh")
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
