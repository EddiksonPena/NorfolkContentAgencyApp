import SwiftUI

struct BookingView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Book an Appointment")
                .font(.largeTitle.bold())
                .padding(.top)
            Text("[Calendar and booking form coming soon]")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Book")
    }
}

#Preview {
    BookingView()
} 