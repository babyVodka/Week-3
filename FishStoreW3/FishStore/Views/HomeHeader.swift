import SwiftUI

struct HomeHeader: View {
    var storeName: String
    var subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "fish.circle.fill") // Hoặc Image("logo")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(storeName)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button { } label: {
                Image(systemName: "bell")
                    .font(.title3)
            }
            
            Button { } label: {
                Image(systemName: "cart")
                    .font(.title3)
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
