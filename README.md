# Aura CRM

A modern, high-performance Customer Relationship Management (CRM) application built with Flutter using professional Clean Architecture principles and robust BLoC state management.

---

## Key Features

- **Splash Screen**: Seamless loading screen to orchestrate initial state initialization and boot tasks.
- **Secure Authentication**: Clean Login module using robust form validations and stateful error/success handling with BLoC.
- **Interactive Dashboard**: Modular, high-level coordinator rendering stateless performance metrics cards and a real-time activity feed.
- **Clean State Management**: 100% reactive state management driven by `flutter_bloc`.
- **Modern Routing**: Clean, declarations-based navigation setup utilizing `go_router`.
- **Premium Aesthetics**: Vibrant harmonious colors, rounded modular cards, professional typography, and responsive scroll dynamics.

---

## Directory & Architectural Structure

The project strictly follows a **Feature-first Clean Architecture** layout:

```text
lib/
├── app/
│   ├── routes/          # Navigation configuration using go_router
│   └── app.dart         # Global MultiBlocProvider and MaterialApp configuration
├── core/
│   └── widgets/         # Shared core widgets (e.g. loaderWidget)
└── features/
    ├── auth/            # Authentication feature (pages, widgets, bloc)
    ├── dashboard/       # Dashboard feature (pages, widgets, bloc)
    └── splash/          # Splash feature (pages, bloc)
```

Within each feature (e.g. `dashboard/`), the folders are separated logically by layer:
- **`data`**: Source repositories and models.
- **`domain`**: Entities, use-cases, and interface contracts.
- **`presentation`**: BLoCs, pages, and modular sub-widgets (extracted inside a clean `/widgets` folder).

---

## Technology Stack

- **Framework**: [Flutter](https://flutter.dev) (Dart)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Icons**: Material Icons

---

## Getting Started

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. Run the command below to verify your setup:

```bash
flutter doctor
```

### Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd nexus_crm
   ```

2. **Fetch all dependencies**:
   ```bash
   flutter pub get
   ```

3. **Verify Static Code Correctness**:
   Make sure there are zero static analysis warnings or compilation errors:
   ```bash
   flutter analyze
   ```

### Running the Application

To run the application in debug mode on a connected emulator, simulator, or desktop device:

```bash
flutter run
```

---

## Code Quality Standards

This codebase enforces:
- **100% Stateless UI Elements**: Keep page layouts light and modular by extracting child views into `widgets/`.
- **Proper BLoC Triggering**: Zero business logic or state mutations inside view layers.
- **Zero Warnings**: High code quality with no analysis issues allowed.
