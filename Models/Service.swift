import Foundation

struct Service: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let duration: String
    let ctaLabel: String
} 