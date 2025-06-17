# 🛍️ AUVNET Flutter Internship Assessment

A clean architecture Flutter app with BLoC state management, featuring Firebase Authentication, Firestore, and Hive local caching.

---

## 📸 Screenshots

## 🌊 Splash
![Splash](https://github.com/user-attachments/assets/fc49cf7e-d75c-4d3e-a832-bab0d4d4626a)

### 👣 OnBoarding
![OnBoarding1](https://github.com/user-attachments/assets/994baf35-74db-469f-8f6c-a8949292a257)
![OnBoarding2](https://github.com/user-attachments/assets/ee04f3dc-18e6-4662-8a84-280166c71de2)
![OnBoarding3](https://github.com/user-attachments/assets/c22a3614-170d-430a-8785-c82ef4efa1b2)

## 🔐 Login
![Login](https://github.com/user-attachments/assets/a7318850-c5de-43f7-ba0a-3b658f414c79)

## 📝 Register
![Register](https://github.com/user-attachments/assets/e3f5a8d1-d378-470c-9b2b-3819512f289c)

### 🏠 Home Page
![Home](https://github.com/user-attachments/assets/3f173456-ede1-44b3-830d-bd31b4d70890)
![Home2](https://github.com/user-attachments/assets/103e599d-b62e-4f38-993a-06839df07532)

---
✨ Features
- User registration and login with Firebase Authentication
- Local user data caching using Hive
- Splash screen, Onboarding flow, Login, Register, and Home
- Home view displays: banners, services, restaurants, and user profile
- Full state management using the BLoC pattern
- Project follows Clean Architecture principles for scalability and separation of concerns
---

## 🚀 Project Setup & Installation

1. **Clone the repository**  
   ```
   git clone https://github.com/<your-username>/AUVNET-Flutter-Internship-Assessment.git
   cd AUVNET-Flutter-Internship-Assessment
2. **Install dependencies** 
   ```
   flutter pub get
3. **Configure Firebase**
- Create a Firebase project (Android & iOS).
- Add google-services.json (Android) and GoogleService-Info.plist (iOS).
- Enable Email/Password Authentication and Firestore Database.
   
4. **Set up Hive for local caching**
   In your main.dart:
   ```
   await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());
   await Hive.openBox<UserModel>(kUserBox);
   ```
   Add this in dispose() of MyApp:
   ```
   @override
   void dispose() {
   Hive.close();
   super.dispose();
   }
 
5. **Run the app**
   ```
   flutter run

---

## 📁 Folder Structure

```markdown
## 📁 Folder Structure

```bash
lib/
│
├── core/                        # Core functionalities shared across the app
│   ├── errors/                  # Error handling and failure models
│   ├── helper/                  # Helper functions and extensions
│   ├── routing/                 # Route management and navigation setup
│   ├── theming/                 # Theme, styles and design system
│   ├── utils/                   # General utility functions
│   └── widgets/                 # Shared/reusable widgets
│
├── features/                    # Feature-based structure
│   └── auth/                    # Authentication feature
│       ├── data/               # Data layer
│       │   ├── data_sources/   # Remote/local data sources
│       │   ├── models/         # Data models
│       │   └── repos/          # Auth repository implementations
│       ├── domain/             # Domain layer
│       │   ├── entities/       # Domain entities (business objects)
│       │   ├── repos/          # Abstract repository interfaces
│       │   └── use_cases/      # Business logic (use cases)
│       └── presentation/       # UI layer
│           ├── manager/        # State management (e.g., Bloc, Cubit)
│           └── views/          # UI screens and widgets
│
│   ├── home/                    # Home feature
│   ├── home_layout/            # Layout specific to home structure
│   ├── on_boarding/            # Onboarding screens
│   └── splash/                 # Splash screen feature
│
├── generated/                  # Generated files (e.g., Firebase, Freezed)
│   └── firebase_options.dart   # Firebase initialization config
│
└── main.dart                   # Application entry point
```

---

## 📦 Some Packages Used

| Package                | Purpose                         |
|------------------------|----------------------------------|
| flutter_bloc           | State management (BLoC pattern) |
| get_it                 | Dependency injection            |
| equatable              | Value equality for models       |
| flutter_screenutil     | Responsive design and screen size adaptation |
| firebase_core          | Firebase core integration and initialization |
| firebase_auth          | Firebase Authentication for user sign-in/sign-up |
| Hive                   | Local user caching              |

---
💡 Rationale & Clean Architecture
- Domain Layer: Contains business logic (use_cases, entities) without dependency on external frameworks.

- Data Layer: Talks to Firebase/Auth/Hive; returns domain entities.

- Presentation Layer: Manages state via BLoC, reacts to changes.

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request.

---

## 🙋‍♀️ Author

- **Basmala Hesham**
  - GitHub: https://github.com/basmalahesham
  - LinkedIn: https://www.linkedin.com/in/basmala-hesham-14791a247/
