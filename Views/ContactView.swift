import SwiftUI
import MapKit

struct ContactView: View {
    @State private var form = ContactForm()
    @State private var isSending = false
    @State private var showConfirmation = false
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case name, email, phone, message
    }
    
    let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.8508, longitude: -76.2859),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Text("Contact Us")
                    .font(.largeTitle.bold())
                    .padding(.top)
                VStack(spacing: 20) {
                    TextField("Name", text: $form.name)
                        .textContentType(.name)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(14)
                        .focused($focusedField, equals: .name)
                    TextField("Email", text: $form.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(14)
                        .focused($focusedField, equals: .email)
                    TextField("Phone", text: $form.phone)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(14)
                        .focused($focusedField, equals: .phone)
                    TextEditor(text: $form.message)
                        .frame(height: 100)
                        .padding(8)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(14)
                        .focused($focusedField, equals: .message)
                        .overlay(
                            Group {
                                if form.message.isEmpty {
                                    Text("Message")
                                        .foregroundColor(.secondary)
                                        .padding(.leading, 12)
                                        .padding(.top, 8)
                                        .allowsHitTesting(false)
                                }
                            }, alignment: .topLeading
                        )
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 24).fill(Color(.systemBackground)).shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4))
                Button(action: {
                    isSending = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isSending = false
                        showConfirmation = true
                    }
                }) {
                    HStack {
                        if isSending {
                            ProgressView()
                        }
                        Text(isSending ? "Sending..." : "Send Message")
                            .font(.headline.bold())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(form.isValid ? Color.accentColor : Color.gray.opacity(0.4))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .shadow(radius: 4, y: 2)
                }
                .disabled(!form.isValid || isSending)
                .scaleEffect(isSending ? 0.97 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSending)
                if showConfirmation {
                    VStack(spacing: 8) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.green)
                        Text("Your message has been sent!")
                            .font(.headline)
                    }
                    .padding(.top, 8)
                    .transition(.scale.combined(with: .opacity))
                }
                VStack(spacing: 16) {
                    Button(action: {
                        if let url = URL(string: "tel://+17575551234") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("Call (757) 555-1234")
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .shadow(radius: 2, y: 2)
                    }
                    .padding(.top, 8)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Business Hours")
                            .font(.headline)
                        Text("Mon-Fri: 9am - 6pm")
                        Text("Sat: 10am - 2pm")
                        Text("Sun: Closed")
                    }
                    .padding(.top, 8)
                    Map(coordinateRegion: .constant(region))
                        .frame(height: 180)
                        .cornerRadius(18)
                        .shadow(radius: 4, y: 2)
                }
                .padding(.horizontal, 2)
            }
            .padding()
        }
        .navigationTitle("Contact")
    }
}

#Preview {
    ContactView()
} 