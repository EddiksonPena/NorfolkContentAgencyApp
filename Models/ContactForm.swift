import Foundation

struct ContactForm {
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var message: String = ""
    
    var isValid: Bool {
        !name.isEmpty && email.contains("@") && !message.isEmpty
    }
} 