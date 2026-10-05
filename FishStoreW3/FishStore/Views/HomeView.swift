import SwiftUI

struct HomeView: View {
    @State private var categories: [ProductCategory] = []
    @State private var products: [Product] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 1. Gọi HomeHeader
                HomeHeader(
                    storeName: "Cá Cảnh Xinh",
                    subtitle: "Khong xinh bang em"
                )
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        // 2. Gọi SearchBarView
                        SearchBarView()
                        
                        // 3. Gọi BannerView
                        BannerView()
                        
                        // 4. Gọi CategoryRowView
                        CategoryRowView(categories: categories)
                        
                        // 5. Khối Sản phẩm nổi bật
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Sản phẩm nổi bật")
                                    .font(.headline)
                                Spacer()
                                Button("Xem tất cả >") { }
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                            .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(products) { product in
                                        ProductCardView(product: product)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                loadSampleData()
            }
        }
    }
    
    // Nạp dữ liệu giả lập để các View con có dữ liệu hiển thị
    private func loadSampleData() {
        self.categories = [
            ProductCategory(name: "Cá cảnh", iconName: "fish"),
            ProductCategory(name: "Cây thủy sinh", iconName: "leaf"),
            ProductCategory(name: "Phụ kiện", iconName: "gearshape"),
            ProductCategory(name: "Thiết bị lọc", iconName: "line.3.horizontal.decrease.circle")
        ]
        
        self.products = [
            Product(name: "Cá Neon Tetra", categoryId: UUID(), price: 20000, imageName: "fish.fill", description: "Cá neon đẹp", stock: 100),
            Product(name: "Cây Java Fern", categoryId: UUID(), price: 50000, imageName: "leaf.fill", description: "Cây thủy sinh", stock: 50),
            Product(name: "Máy lọc nước", categoryId: UUID(), price: 350000, imageName: "drop.fill", description: "Lọc nước", stock: 20)
        ]
    }
}

#Preview {
    HomeView()
}
