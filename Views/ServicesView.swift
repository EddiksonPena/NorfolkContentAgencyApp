import SwiftUI

struct ServicesView: View {
    let services: [Service] = [
        Service(imageName: "video", title: "Video Editing", description: "Professional editing for all your video needs.", duration: "1-2 weeks", ctaLabel: "Book Now"),
        Service(imageName: "social", title: "Social Media Content", description: "Engaging content for all platforms.", duration: "3-5 days", ctaLabel: "Book Now"),
        Service(imageName: "reels", title: "Reels & Shorts", description: "Short-form video for maximum impact.", duration: "2-3 days", ctaLabel: "Book Now"),
        Service(imageName: "commercial", title: "Commercial Videography", description: "High-quality commercials for your business.", duration: "2-4 weeks", ctaLabel: "Book Now")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Our Services")
                    .font(.largeTitle.bold())
                    .padding(.top)
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(services) { service in
                        ServiceCard(service: service)
                            .transition(.scale.combined(with: .opacity))
                            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: service.id)
                    }
                }
                .padding(.horizontal, 4)
            }
            .padding()
        }
        .navigationTitle("Services")
    }
}

struct ServiceCard: View {
    let service: Service
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(service.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(16)
                .shadow(radius: 6, y: 4)
            Text(service.title)
                .font(.headline)
            Text(service.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Text(service.duration)
                    .font(.caption)
                    .foregroundColor(.accentColor)
                Spacer()
                Button(action: { isPressed.toggle() }) {
                    Text(service.ctaLabel)
                        .font(.subheadline.bold())
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 2, y: 2)
                }
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
        .onTapGesture {
            withAnimation {
                isPressed.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false
            }
        }
    }
}

#Preview {
    ServicesView()
} 