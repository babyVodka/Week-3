import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.green.opacity(0.15))
                .frame(height: 120)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("ƯU ĐÃI THÁNG NÀY")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                    
                    Text("Cá khỏe - Bể đẹp")
                        .font(.title3).bold()
                    Text("Không gian thư giãn cho mọi nhà")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
