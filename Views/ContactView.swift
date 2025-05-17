import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Contact Us")
                .font(.largeTitle.bold())
                .padding(.top)
            Text("[Contact form and map coming soon]")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Contact")
    }
}

#Preview {
    ContactView()
} 