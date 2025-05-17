import SwiftUI
import AVKit

struct PortfolioView: View {
    @State private var selectedCategory: String = "All"
    @State private var selectedMedia: MediaItem? = nil
    @Namespace private var animation
    
    let categories = ["All", "Weddings", "Social Media", "Commercial"]
    let mediaItems: [MediaItem] = [
        MediaItem(imageName: "wedding1", title: "Wedding Highlights", description: "A beautiful wedding story.", category: "Weddings", mediaURL: nil),
        MediaItem(imageName: "social1", title: "Instagram Reel", description: "Short-form content for socials.", category: "Social Media", mediaURL: nil),
        MediaItem(imageName: "commercial1", title: "Brand Ad", description: "Commercial for a local business.", category: "Commercial", mediaURL: nil),
        MediaItem(imageName: "wedding2", title: "Ceremony Recap", description: "Capturing the big day.", category: "Weddings", mediaURL: nil),
        MediaItem(imageName: "social2", title: "TikTok Trend", description: "Viral content for engagement.", category: "Social Media", mediaURL: nil)
    ]
    
    var filteredItems: [MediaItem] {
        selectedCategory == "All" ? mediaItems : mediaItems.filter { $0.category == selectedCategory }
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Portfolio")
                    .font(.largeTitle.bold())
                    .padding(.top)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \ .self) { cat in
                            Button(action: { withAnimation { selectedCategory = cat } }) {
                                Text(cat)
                                    .font(.subheadline.bold())
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == cat ? Color.accentColor : Color(.tertiarySystemBackground))
                                    .foregroundColor(selectedCategory == cat ? .white : .primary)
                                    .cornerRadius(10)
                                    .shadow(color: selectedCategory == cat ? Color.accentColor.opacity(0.2) : .clear, radius: 4, y: 2)
                            }
                            .scaleEffect(selectedCategory == cat ? 1.08 : 1.0)
                            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: selectedCategory)
                        }
                    }
                    .padding(.horizontal, 4)
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredItems) { item in
                            PortfolioCard(item: item)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                        selectedMedia = item
                                    }
                                }
                                .matchedGeometryEffect(id: item.id, in: animation)
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .padding()
            if let media = selectedMedia {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { selectedMedia = nil }
                    }
                VStack(spacing: 16) {
                    ZStack(alignment: .topTrailing) {
                        VStack(spacing: 0) {
                            Image(media.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 220)
                                .cornerRadius(20)
                                .shadow(radius: 10, y: 6)
                                .matchedGeometryEffect(id: media.id, in: animation)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(media.title)
                                    .font(.title2.bold())
                                Text(media.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                        Button(action: { withAnimation { selectedMedia = nil } }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .padding(12)
                        }
                    }
                    if let url = media.mediaURL {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: 200)
                            .cornerRadius(16)
                    }
                }
                .frame(maxWidth: 340)
                .background(RoundedRectangle(cornerRadius: 28).fill(Color(.systemBackground)))
                .shadow(radius: 20, y: 10)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .navigationTitle("Portfolio")
    }
}

struct PortfolioCard: View {
    let item: MediaItem
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(16)
                .shadow(radius: 6, y: 4)
            Text(item.title)
                .font(.headline)
            Text(item.category)
                .font(.caption)
                .foregroundColor(.accentColor)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    PortfolioView()
} 