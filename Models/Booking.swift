import Foundation

struct Booking: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var phone: String
    var service: String
    var date: Date
    var time: String
} 