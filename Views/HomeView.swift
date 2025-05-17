import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Norfolk Content Agency")
                .font(.largeTitle.bold())
                .padding(.top, 40)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                NavigationCard(title: "Services", icon: "sparkles", destination: ServicesView())
                NavigationCard(title: "Book", icon: "calendar", destination: BookingView())
                NavigationCard(title: "Portfolio", icon: "photo.on.rectangle", destination: PortfolioView())
                NavigationCard(title: "Contact", icon: "phone", destination: ContactView())
            }
            .padding(.horizontal)
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(.systemBackground), Color(.secondarySystemBackground)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
}

struct NavigationCard<Destination: View>: View {
    let title: String
    let icon: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(.accentColor)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: title)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HomeView()
} 