import SwiftUI

struct PortfolioView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Portfolio")
                .font(.largeTitle.bold())
                .padding(.top)
            Text("[Portfolio grid coming soon]")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Portfolio")
    }
}

#Preview {
    PortfolioView()
} 