# Fitness App

A Flutter-based Fitness application developed as an interview assignment. The project follows a clean and modular architecture using the **BLoC** pattern for state management, making the codebase scalable, maintainable, and easy to extend.

---

# Dependencies Used & Why

| Dependency | Purpose |
|------------|---------|
| **bloc** | Implements the BLoC pattern to separate business logic from the presentation layer. |
| **flutter_bloc** | Provides Flutter widgets such as `BlocProvider`, `BlocBuilder`, and `BlocListener` for integrating BLoC with the UI. |
| **equatable** | Simplifies object comparison for BLoC events and states, reducing unnecessary widget rebuilds. |
| **flutter_svg** | Renders SVG assets for scalable, high-quality icons and illustrations. |
| **syncfusion_flutter_datepicker** | Provides an advanced and customizable calendar/date picker used in the application. |
| **intl** | Formats dates, times, and numbers consistently throughout the application. |
| **cupertino_icons** | Supplies iOS-style icons for a consistent cross-platform experience. |

---

# Dev Dependencies

| Dependency | Purpose |
|------------|---------|
| **flutter_test** | Used for unit and widget testing. |
| **flutter_lints** | Enforces recommended coding standards and best practices. |
| **build_runner** | Generates source code for supported packages. |
| **flutter_gen_runner** | Generates strongly typed asset references for safer asset management. |

---

# Project Structure

```text
lib
├── core
│   ├── constants          # Application constants
│   ├── extensions         # Custom extensions
│   ├── gen                # Generated assets (FlutterGen)
│   ├── theme              # App themes & colors
│   └── utils              # Utility/helper classes
│
├── presentation
│   ├── blocs              # BLoC state management
│   ├── dashboard_widgets  # Dashboard UI widgets
│   ├── models             # UI models
│   ├── mood_widgets       # Mood-related widgets
│   ├── plan_widgets       # Training plan widgets
│   ├── views              # Application screens
│   └── widgets            # Reusable widgets
│
└── main.dart              # Application entry point
```

---

# Architecture

The application follows the **BLoC (Business Logic Component)** architecture.

- Business logic is separated from the UI.
- UI reacts to state changes through BLoC.
- Reusable widgets improve maintainability.
- Modular folder structure makes the project scalable.

---

# Features

- BLoC State Management
- Dark & Light Theme Support
- Custom Reusable Widgets
- SVG Asset Support
- Interactive Calendar
- Modular Architecture
- Responsive UI
- Strongly Typed Assets using FlutterGen

---

# Getting Started

### Clone the repository

```bash
git clone https://github.com/your-username/fitness_app.git
```

### Navigate to the project

```bash
cd fitness_app
```

### Install dependencies

```bash
flutter pub get
```

### Generate assets

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the application

```bash
flutter run
```

---

# Requirements

- Flutter SDK 3.12+
- Dart SDK 3.12+
- Android Studio or VS Code
- Android Emulator / Physical Device

---

# Built With

- Flutter
- Dart
- BLoC
- Flutter BLoC
- FlutterGen
- Syncfusion Date Picker

---

# Deliverables

## 📱 APK

Download the latest APK here:

[⬇️ Download APK](https://github.com/UsamaAliBhatti/Fitness-App/releases/download/v1.0/app-release.apk)

---

## 🎥 Demo Video

Watch the application demo:

[▶️ Watch App Demo Video](https://drive.google.com/file/d/1c0cGVf64uEEIl42gqyIzPNceLjZARBkY/view?usp=sharing)

---

## 📸 Screenshots

View all application screenshots:

[🖼️ View Screenshots](https://github.com/your-username/fitness_app/tree/main/screenshots)

---

## Author

**Usama Ali**
