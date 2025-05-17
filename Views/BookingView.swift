import SwiftUI

struct BookingView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var selectedService = "Video Editing"
    @State private var date = Date()
    @State private var selectedTime = "10:00 AM"
    @State private var isBooking = false
    @State private var showConfirmation = false
    
    let services = ["Video Editing", "Social Media Content", "Reels & Shorts", "Commercial Videography"]
    let timeSlots = ["10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM"]
    
    var formIsValid: Bool {
        !name.isEmpty && email.contains("@") && !phone.isEmpty
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Text("Book an Appointment")
                    .font(.largeTitle.bold())
                    .padding(.top)
                VStack(spacing: 20) {
                    Group {
                        TextField("Name", text: $name)
                            .textContentType(.name)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(14)
                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(14)
                        TextField("Phone", text: $phone)
                            .textContentType(.telephoneNumber)
                            .keyboardType(.phonePad)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(14)
                    }
                    Picker("Service", selection: $selectedService) {
                        ForEach(services, id: \ .self) { service in
                            Text(service)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(14)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Date")
                            .font(.caption)
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Time Slot")
                            .font(.caption)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(timeSlots, id: \ .self) { slot in
                                    Button(action: { selectedTime = slot }) {
                                        Text(slot)
                                            .font(.subheadline)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(selectedTime == slot ? Color.accentColor : Color(.tertiarySystemBackground))
                                            .foregroundColor(selectedTime == slot ? .white : .primary)
                                            .cornerRadius(10)
                                            .shadow(color: selectedTime == slot ? Color.accentColor.opacity(0.2) : .clear, radius: 4, y: 2)
                                    }
                                    .scaleEffect(selectedTime == slot ? 1.08 : 1.0)
                                    .animation(.spring(response: 0.4, dampingFraction: 0.7), value: selectedTime)
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 24).fill(Color(.systemBackground)).shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4))
                Button(action: {
                    isBooking = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isBooking = false
                        showConfirmation = true
                    }
                }) {
                    HStack {
                        if isBooking {
                            ProgressView()
                        }
                        Text(isBooking ? "Booking..." : "Book Now")
                            .font(.headline.bold())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(formIsValid ? Color.accentColor : Color.gray.opacity(0.4))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .shadow(radius: 4, y: 2)
                }
                .disabled(!formIsValid || isBooking)
                .scaleEffect(isBooking ? 0.97 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isBooking)
                if showConfirmation {
                    VStack(spacing: 8) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.green)
                        Text("Your appointment is booked!")
                            .font(.headline)
                    }
                    .padding(.top, 8)
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding()
        }
        .navigationTitle("Book")
    }
}

#Preview {
    BookingView()
} 