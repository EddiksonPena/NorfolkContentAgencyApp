import SwiftUI

@main
struct NorfolkContentAgencyApp: App {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .preferredColorScheme(nil) // Follows system dark/light mode
        }
    }
}
