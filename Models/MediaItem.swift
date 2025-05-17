import Foundation

struct MediaItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let category: String
    let mediaURL: URL?
} 