# Live Assist - Project Structure

This document outlines the clean architecture structure of the Live Assist Flutter project, following SOLID principles and industry best practices.

## 📁 Project Structure

```
lib/
├── core/                           # Core utilities and shared code
│   ├── constants/
│   │   ├── app_constants.dart      # Application-wide constants
│   │   └── app_strings.dart        # String constants for i18n
│   ├── errors/
│   │   ├── failures.dart           # Failure classes for error handling
│   │   └── exceptions.dart         # Exception classes
│   ├── network/
│   │   ├── api_client.dart         # HTTP client configuration
│   │   └── network_info.dart       # Network connectivity checker
│   ├── utils/
│   │   ├── result.dart             # Generic Result class
│   │   └── validators.dart         # Validation utilities
│   └── extensions/
│       └── string_extensions.dart  # String extension methods
│
├── features/                       # Feature-based modules
│   ├── scanner/                    # Barcode scanning feature
│   │   ├── data/
│   │   │   ├── datasources/        # Data sources (API, Local)
│   │   │   ├── models/             # Data models
│   │   │   └── repositories/       # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/           # Business entities
│   │   │   ├── repositories/       # Repository interfaces
│   │   │   └── usecases/           # Business logic use cases
│   │   └── presentation/
│   │       ├── pages/              # UI pages
│   │       ├── widgets/            # Feature-specific widgets
│   │       └── providers/          # State management providers
│   │
│   ├── history/                    # Scan history feature
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── widgets/
│   │       └── providers/
│   │
│   ├── settings/                   # Settings feature
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── widgets/
│   │       └── providers/
│   │
│   └── video_call/                 # Video calling feature
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── pages/
│           ├── widgets/
│           └── providers/
│
├── shared/                         # Shared components and utilities
│   ├── widgets/                    # Reusable UI components
│   │   ├── custom_app_bar.dart     # Custom app bar widget
│   │   ├── custom_button.dart      # Custom button widget
│   │   └── custom_bottom_nav_bar.dart # Bottom navigation widget
│   ├── themes/                     # App theming
│   │   └── app_theme.dart          # Theme configuration
│   ├── services/                   # Shared services
│   └── constants/                  # Shared constants
│
└── main.dart                       # App entry point
```

## 🏗️ Architecture Layers

### 1. **Core Layer**
- **Purpose**: Contains utilities, constants, and shared functionality
- **Dependencies**: None (pure Dart)
- **Contains**:
  - Constants and configuration
  - Error handling classes
  - Network utilities
  - Validation helpers
  - Extension methods

### 2. **Features Layer**
Each feature follows the same structure:

#### **Data Layer**
- **Purpose**: Handles data sources and data models
- **Dependencies**: Core layer
- **Contains**:
  - Remote data sources (API calls)
  - Local data sources (To be implemented)
  - Data models (JSON serialization)
  - Repository implementations

#### **Domain Layer**
- **Purpose**: Contains business logic and entities
- **Dependencies**: Core layer
- **Contains**:
  - Entities (business objects)
  - Repository interfaces
  - Use cases (business logic)

#### **Presentation Layer**
- **Purpose**: Handles UI and user interactions
- **Dependencies**: Domain layer, Data layer, Core layer
- **Contains**:
  - Pages (screens)
  - Widgets (UI components)
  - Providers (state management)

### 3. **Shared Layer**
- **Purpose**: Reusable components across features
- **Dependencies**: Core layer
- **Contains**:
  - Common widgets
  - Theme configuration
  - Shared services

## 🔧 SOLID Principles Implementation

### **Single Responsibility Principle (SRP)**
- Each class has one reason to change
- Separated concerns across layers
- Clear separation between UI, business logic, and data

### **Open/Closed Principle (OCP)**
- Open for extension, closed for modification
- Abstract base classes for scanners, repositories
- Plugin architecture for different guide types

### **Liskov Substitution Principle (LSP)**
- All implementations are interchangeable
- Repository implementations are swappable
- Scanner implementations work seamlessly

### **Interface Segregation Principle (ISP)**
- Separate interfaces for different concerns
- `IScanner`, `IVideoCall`, `IProductGuide` interfaces
- Clients don't depend on unused methods

### **Dependency Inversion Principle (DIP)**
- Depend on abstractions, not concretions
- Dependency injection for all services
- Abstract data sources and external APIs

## 📱 Navigation Structure

The app uses a bottom navigation bar with three main sections:

1. **Scanner** - Product scanning and search
2. **History** - Previously scanned products
3. **Settings** - App configuration and preferences

## 🛠️ Technology Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Video Calling**: WebRTC
- **Barcode Scanning**: Mobile Scanner
- **Local Storage**: To be implemented
- **Network**: Dio
- **Dependency Injection**: GetIt + Injectable
- **Testing**: Mockito + Flutter Test

## 🚀 Getting Started

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate Code**
   ```bash
   flutter packages pub run build_runner build
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## 📋 Development Guidelines

### **Code Organization**
- Follow the established folder structure
- Keep related code together
- Use meaningful names for files and classes

### **State Management**
- Use Riverpod for state management
- Keep business logic in use cases
- Separate UI state from business state

### **Error Handling**
- Use the Result class for error handling
- Convert exceptions to failures
- Provide meaningful error messages

### **Testing**
- Write unit tests for use cases
- Write widget tests for UI components
- Write integration tests for user flows

### **Documentation**
- Document public APIs
- Use meaningful comments
- Keep README updated

## 🔄 Data Flow

1. **User Interaction** → UI Widget
2. **UI Widget** → Provider/Notifier
3. **Provider** → Use Case
4. **Use Case** → Repository Interface
5. **Repository** → Data Source
6. **Data Source** → API/Local Storage
7. **Response** → Model → Entity → UI

This structure ensures maintainable, testable, and scalable code that follows industry best practices and SOLID principles.
