/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'Live Assist';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.liveassist.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userPreferencesKey = 'user_preferences';
  static const String scanHistoryKey = 'scan_history';
  static const String settingsKey = 'app_settings';
  
  // Video Call Configuration
  static const int maxVideoCallDuration = 3600; // 1 hour in seconds
  static const int maxParticipants = 2;
  
  // Scanner Configuration
  static const Duration scanTimeout = Duration(seconds: 10);
  static const List<String> supportedBarcodeFormats = [
    'QR_CODE',
    'CODE_128',
    'CODE_39',
    'EAN_13',
    'EAN_8',
    'UPC_A',
    'UPC_E',
  ];
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Error Messages
  static const String networkErrorMessage = 'Network connection error. Please check your internet connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String unknownErrorMessage = 'An unknown error occurred. Please try again.';
  static const String cameraPermissionMessage = 'Camera permission is required to scan barcodes.';
  static const String microphonePermissionMessage = 'Microphone permission is required for video calls.';
  
  // Success Messages
  static const String productFoundMessage = 'Product found successfully!';
  static const String scanSavedMessage = 'Scan saved to history.';
  static const String callConnectedMessage = 'Video call connected successfully.';
  
  // Validation
  static const int minBarcodeLength = 8;
  static const int maxBarcodeLength = 20;
  static const int maxSearchQueryLength = 100;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
}
