# 🍽️ Local Restaurants

A modern, feature-rich Flutter application for discovering restaurants around the world. Explore cuisines from different countries with a beautiful, intuitive interface that supports multiple languages.

This is just demo app, for learning and testing purposes not meant to be a production ready one. 

<img width="480" height="640" alt="Image" src="https://github.com/user-attachments/assets/3efb43c7-3cfa-4bee-8ffb-0024bf1d78d2" />

<img width="480" height="640" alt="Image" src="https://github.com/user-attachments/assets/05e520f2-277f-42e8-b76c-e63e1d9b8be4" />

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white)

## ✨ Features

### 🌍 **Global Restaurant Discovery**
- Browse restaurants by country and capital city
- Explore diverse cuisines from around the world
- Real-time restaurant information with ratings and reviews

### 🎨 **Modern UI/UX Design**
- **Material 3 Design System** with beautiful animations
- **Dark & Light Theme Support** with system preference detection
- **Smooth Micro-interactions** and page transitions
- **Glassmorphism Effects** and gradient backgrounds
- **Responsive Design** that works on all screen sizes

### 🌐 **Internationalization (i18n)**
- **Bilingual Support**: English 🇺🇸 and Spanish 🇪🇸
- **Dynamic Language Switching** with persistent preferences
- **Localized Content** including restaurant names and descriptions
- **Cultural Adaptation** for different regions

### 🔐 **Authentication System**
- **Secure Login/Registration** with form validation
- **Persistent User Sessions** using SharedPreferences
- **Modern Form Design** with animated inputs
- **Error Handling** with user-friendly messages

### 🏪 **Restaurant Features**
- **Detailed Restaurant Cards** with images, ratings, and info
- **Interactive Restaurant Details** in modal bottom sheets
- **Restaurant Information**: Address, phone, hours, cuisine type
- **Status Indicators**: Open/Closed with real-time updates
- **Price Range Indicators** and rating systems

### 🔍 **Advanced Search & Navigation**
- **Real-time Search** with instant filtering
- **Smooth Navigation** between countries and restaurants
- **Pull-to-Refresh** functionality
- **Loading States** with shimmer effects
- **Empty States** with helpful guidance

### 🎭 **Animations & Interactions**
- **Entrance Animations** using animate_do package
- **Staggered List Animations** for better visual flow
- **Interactive Cards** with press feedback
- **Smooth Page Transitions** and hero animations
- **Loading Shimmer Effects** for better perceived performance

## 📱 Screenshots

*Add your app screenshots here*

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/local_restaurants.git
   cd local_restaurants
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── config/
│   └── app_theme.dart          # App theming and Material 3 design
├── l10n/                       # Internationalization
│   ├── app_en.arb             # English translations
│   ├── app_es.arb             # Spanish translations
│   └── app_localizations.dart  # Generated localization classes
├── models/
│   ├── country.dart           # Country data model
│   └── restaurant.dart        # Restaurant data model
├── providers/
│   └── locale_provider.dart   # Language state management
├── services/
│   ├── countries_api.dart     # Countries API service
│   └── restaurant_service.dart # Restaurant data service
├── utils/
│   ├── authenticated.dart     # Authentication utilities
│   └── shared_preferences_util.dart # Local storage utilities
├── view/
│   ├── login_page.dart        # Authentication screens
│   ├── register_page.dart
│   ├── search_pages.dart      # Main country search
│   └── restaurants_page.dart  # Restaurant listing
├── view_model/
│   ├── register_page_view_model.dart # Registration logic
│   └── search_view_model.dart        # Search state management
├── widgets/
│   ├── countries_list_view.dart      # Country listing widget
│   ├── country_tile.dart             # Individual country card
│   ├── custom_search_bar.dart        # Search input component
│   ├── language_selector.dart        # Language switcher
│   ├── restaurant_card.dart          # Restaurant display card
│   └── shimmer_loading.dart          # Loading animations
└── main.dart                         # App entry point
```

## 🛠️ Technologies Used

### **Core Framework**
- **Flutter 3.x** - Cross-platform mobile development
- **Dart** - Programming language
- **Material 3** - Modern design system

### **State Management**
- **Provider** - Simple and efficient state management
- **ChangeNotifier** - Reactive state updates

### **Internationalization**
- **flutter_localizations** - Built-in Flutter i18n support
- **intl** - Internationalization utilities
- **ARB files** - Application Resource Bundle for translations

### **UI/UX Libraries**
- **animate_do** - Beautiful entrance animations
- **shimmer** - Loading skeleton animations

### **Data & Storage**
- **http** - REST API communication
- **shared_preferences** - Local data persistence
- **validators** - Form validation utilities

### **Development Tools**
- **flutter_lints** - Code quality and style enforcement
- **Material Icons** - Comprehensive icon library

## 🌟 Key Features Breakdown

### Authentication Flow
```dart
Login → Validation → Dashboard → Restaurant Discovery
  ↓
Registration → Account Creation → Auto-login
```

### Restaurant Discovery Flow
```dart
Country Selection → City Restaurants → Restaurant Details → Actions
     ↓                    ↓                    ↓              ↓
Search & Filter → Loading States → Modal Details → Call/Directions
```

### Internationalization Flow
```dart
Language Selection → Preference Storage → App Restart → Localized Content
        ↓                    ↓                ↓              ↓
    UI Update → Persistent Setting → Dynamic Loading → Cultural Adaptation
```

## 🎨 Design System

### **Color Palette**
- **Primary**: Indigo (#6366F1) - Modern and professional
- **Secondary**: Purple (#8B5CF6) - Creative and engaging  
- **Tertiary**: Cyan (#06B6D4) - Fresh and vibrant
- **Surface**: Adaptive based on theme (Light/Dark)

### **Typography**
- **Headlines**: Roboto Bold - Clear hierarchy
- **Body Text**: Roboto Regular - Excellent readability
- **Captions**: Roboto Medium - Subtle information

### **Spacing System**
- **Base Unit**: 8px for consistent spacing
- **Component Padding**: 16px, 20px, 24px
- **Section Margins**: 32px, 48px, 60px

## 🔧 Configuration

### **Environment Setup**
The app uses mock data by default. To integrate with real APIs:

1. **Restaurant API Integration**
   ```dart
   // In lib/services/restaurant_service.dart
   // Replace mock data with real API calls
   // Recommended APIs: Google Places, Foursquare, Zomato
   ```

2. **API Keys Configuration**
   ```dart
   // Create lib/config/api_keys.dart
   class ApiKeys {
     static const String googlePlaces = 'YOUR_API_KEY';
     static const String restaurantApi = 'YOUR_API_KEY';
   }
   ```

### **Localization Setup**
Add new languages by:
1. Creating new ARB files (e.g., `app_fr.arb` for French)
2. Running `flutter gen-l10n`
3. Adding locale to `supportedLocales` in `main.dart`

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 📦 Building for Production

### **Android**
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### **iOS**
```bash
flutter build ios --release
```
