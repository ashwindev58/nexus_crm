# Aura CRM (Nexus CRM)

A modern, high-performance Customer Relationship Management (CRM) application built with Flutter using professional Clean Architecture principles and robust BLoC state management.

---

## 🏢 Architectural Design: Feature-First Clean Architecture

The application is structured using a **Feature-first Clean Architecture** pattern. This ensures that the codebase is highly decoupled, modular, scalable, and easy to maintain by multiple engineers concurrently.

### Directory Structure

```text
lib/
├── app/
│   ├── routes/          # Navigation configurations using go_router
│   └── app.dart         # Global MultiBlocProvider and MaterialApp configuration
├── core/
│   └── widgets/         # Shared core components (e.g. loaderWidget, CustomTextField)
└── features/
    ├── auth/            # Authentication Feature Module
    │   ├── data/        # Data Sources and Auth Models
    │   ├── domain/      # Auth Entities and Use Cases
    │   └── presentation/# Pages, BLoC (AuthBloc), and sub-widgets (extracted views)
    ├── dashboard/       # Dashboard Feature Module
    │   ├── data/
    │   └── presentation/# Metrics dashboard cards, meeting lists, activity timeline
    ├── splash/          # Splash Feature Module
    │   └── presentation/# Startup boot orchestrator
    └── companies/       # Companies Feature Module
        ├── data/        # Models (sub-models Address, Geo, CompanyInfo extracted)
        └── presentation/# List coordinator, BLoC, and modular child detail views
```

Each feature is divided into three isolated layers:
1. **Data Layer**: Responsible for mapping external API schemas to local Models (using factory constructors) and managing network data calls.
2. **Domain Layer**: Houses clean core Entities and business Use Cases, remaining free from third-party framework dependencies.
3. **Presentation Layer**: Coordinates UI rendering and State Management via BLoC. Standardizes a **<60-line code constraint** for screen coordinators and list views by extracting presentational widgets.

---

## ⚡ State Management Choice & Justification

We utilize **`flutter_bloc`** as the core state management system:
* **Predictability**: BLoC relies on strict events mapped linearly to states. This unidirectional data flow completely eliminates unpredictable mutations and racing conditions.
* **Separation of Concerns**: The business logic is 100% separated from UI files, facilitating clean unit testing.
* **Developer Experience**: Standardizes the way events are registered and handled, which is ideal for multi-engineer production environments.
* **Performance**: Stream-based updates ensure that only widgets wrapped inside specific `BlocBuilder`s rebuild, preventing redundant widget-tree invalidation.

---

## 📦 Packages Used

* **`flutter_bloc` (v9.1.1)**: Unidirectional stream-based state management.
* **`go_router` (v17.2.3)**: Declarative, path-based routing that handles deep-linking and state transitions.
* **`http` (v1.6.0)**: Robust, asynchronous HTTP networking client for parsing REST APIs.
* **`cupertino_icons` (v1.0.8)**: Supporting aesthetic visual cues.

---

## ⚖️ Architectural Tradeoffs Made

1. **Client-Side Filtering vs. Server-Side Filtering**:
   * *Tradeoff*: For the mockup, we query the full `/users` list once and process the search queries and segment tabs (`All`, `Active`, `Pending`, `Inactive`) locally inside `CompaniesBloc`.
   * *Justification*: Minimizes repeated network latency on fast user keystrokes, providing a high-fidelity, instantaneous search feel. In production, this can be seamlessly migrated to query parameter requests (e.g. `?q=search_term`) as the database scales.
2. **Mock UI Enrichment**:
   * *Tradeoff*: JSONPlaceholder does not return visual traits (company status, colors, avatars). We dynamically inject these traits in the Data mapping phase.
   * *Justification*: Preserves clean architecture separations since UI representations remain inside the model mapper, while supplying the presentation layer with data for high-fidelity badges.

---

## 🚀 How to Run the Project

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
   Confirm that the static analyzer returns zero errors or warnings:
   ```bash
   flutter analyze
   ```

4. **Run the Application**:
   Run in debug mode on a connected device, emulator, or simulator:
   ```bash
   flutter run
   ```
