# Live Assist

A comprehensive product support and expert assistance platform built with Flutter, featuring real-time video consultation and product guidance capabilities.

## 🎯 Project Overview

Live Assist is a mobile application that bridges the gap between product users and expert support through innovative barcode scanning, interactive product guides, and real-time video consultation. The platform consists of two main interfaces:

- **Mobile App**: User-facing application for product scanning, guide access, and expert consultation
- **Expert Dashboard**: Desktop interface for support agents to manage calls and provide assistance

## ✨ Key Features

### 📱 Mobile Application
- **Product Scanner**: Barcode scanning functionality to identify products and access relevant information
- **Product Guides**: Interactive guides and tutorials for product usage and troubleshooting
- **Video Consultation**: Real-time video calls with product experts for personalized support
- **Search Functionality**: Quick product search and discovery
- **History Tracking**: Access to previously scanned products and consultation history

### 🖥️ Expert Dashboard
- **Call Management**: Handle incoming video calls from users
- **Ticket System**: Track and manage support tickets with unique call IDs
- **Real-time Communication**: Video call interface with users
- **Note-taking**: Document call details and resolutions
- **Call Controls**: Mute, video toggle, chat, and screen sharing capabilities

## 🏗️ Architecture & Design Principles

This project is built following **SOLID principles** and **clean architecture** patterns to demonstrate professional coding practices:

### SOLID Principles Implementation
- **Single Responsibility**: Each class/module has one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Liskov Substitution**: Derived classes must be substitutable for base classes
- **Interface Segregation**: Clients shouldn't depend on interfaces they don't use
- **Dependency Inversion**: Depend on abstractions, not concretions

### Clean Architecture Layers
- **Presentation Layer**: UI components, state management, and user interactions
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Repositories, data sources, and external service integrations

## 🚀 Navigation Structure

The mobile application features three main navigation sections:

1. **Scanner** - Product scanning and search functionality
2. **History** - Previously scanned products and consultation records
3. **Settings** - App configuration and user preferences

## 🛠️ Technology Stack

- **Framework**: Flutter 3.8.1+
- **Language**: Dart
- **State Management**: Provider/Riverpod (TBD)
- **Video Calling**: WebRTC integration
- **Barcode Scanning**: Camera and barcode scanning libraries
- **Backend**: RESTful API integration
- **Database**: Local storage with SQLite/Hive

## 📋 Development Roadmap

### Phase 1: Core Foundation
- [ ] Project structure setup with clean architecture
- [ ] Navigation implementation (Scanner, History, Settings)
- [ ] Basic UI/UX design system
- [ ] State management setup

### Phase 2: Scanner Module
- [ ] Barcode scanning functionality
- [ ] Product search and identification
- [ ] Camera integration and permissions

### Phase 3: Product Guides
- [ ] Guide content management
- [ ] Interactive guide display
- [ ] Offline guide support

### Phase 4: Video Consultation
- [ ] WebRTC integration
- [ ] Video call UI implementation
- [ ] Call management system

### Phase 5: Expert Dashboard
- [ ] Desktop application setup
- [ ] Expert authentication and management
- [ ] Call handling interface
- [ ] Ticket management system

## 🎨 UI/UX Design

The application follows a modern, professional design with:
- Dark theme for main navigation
- Clean, intuitive interface
- Consistent iconography and typography
- Responsive design for various screen sizes
- Accessibility considerations

## 🔧 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Git

### Installation
```bash
# Clone the repository
git clone <repository-url>
cd live_assist

# Install dependencies
flutter pub get

# Run the application
flutter run
```

## 📱 Supported Platforms

- Android
- iOS
- Web (for expert dashboard)
- Desktop (Windows, macOS, Linux)

## 🤝 Contributing

This project follows professional development practices:
- Code reviews for all changes
- Comprehensive testing strategy
- Documentation standards
- Git flow workflow
- SOLID principles adherence

## 👨‍💻 Developer

**MANISH RANJAN**  
📧 manishranjan.soft@gmail.com  
💼 manish.ranjan@12thwonder.com

## 📄 License

This project is developed as a showcase of professional Flutter development skills and clean architecture implementation.

---

*Built with ❤️ using Flutter and following industry best practices*
