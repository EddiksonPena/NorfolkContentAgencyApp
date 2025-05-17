import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Our Services")
                .font(.largeTitle.bold())
                .padding(.top)
            List {
                Text("Video Editing")
                Text("Social Media Content Creation")
                Text("Reels & Shorts")
                Text("Commercial Videography")
            }
            .listStyle(.insetGrouped)
        }
        .padding()
        .navigationTitle("Services")
    }
}

#Preview {
    ServicesView()
} 