# Norfolk Content Agency App

A sleek, modern iOS app for a Norfolk, VA-based content creation agency. Built with SwiftUI, Supabase, and best-in-class UI/UX.

---

## 🚀 Setup Instructions

1. **Clone the repo:**
   ```sh
   git clone https://github.com/EddiksonPena/NorfolkContentAgencyApp.git
   cd NorfolkContentAgencyApp
   ```
2. **Open in Xcode:**
   - Open `NorfolkContentAgencyApp.xcodeproj` (to be generated)
3. **Install dependencies:**
   - Add Supabase Swift SDK via Swift Package Manager
   - Add any UI/animation libraries as needed
4. **Configure Supabase:**
   - Add your Supabase URL and anon key to the project config

---

## 🏗️ Architecture Overview

- **SwiftUI** for all UI
- **MVVM** (Models, Views, ViewModels) pattern
- **Supabase** for backend (auth, database, storage)
- **Modern UI**: Animations, dark/light mode, Framer Motion-inspired transitions
- **Modular structure**:
  - `Views/` – UI screens
  - `Models/` – Data models
  - `ViewModels/` – Business logic
  - `API/` – Supabase and integrations

---

## 🧠 MCP Touchpoints

- **context7**: Apple/SwiftUI best practices, navigation, Combine, dev tools
- **github**: Repo management, versioning, CI/CD
- **spa base**: Supabase for tables, auth, storage, real-time
- **@21st-dev/magic**: UI/UX style, reusable components, design helpers

---

## 🗄️ Supabase Table Descriptions

- **clients**: id, name, email, phone
- **appointments**: id, client_id, service_id, date, time, status
- **media**: id, url, category, title, description
- **contacts**: id, name, email, message, created_at

---

## ✨ Features
- Service exploration
- Appointment scheduling
- Portfolio browsing
- Contact forms & direct communication

---

## 📞 Contact
Norfolk Content Agency, Norfolk, VA
