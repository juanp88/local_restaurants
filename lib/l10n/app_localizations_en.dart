// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Local Restaurants';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get signInToContinue => 'Sign in to discover amazing restaurants';

  @override
  String get username => 'Username';

  @override
  String get enterUsername => 'Enter your username';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinUsToDiscover => 'Join us to discover amazing restaurants';

  @override
  String get chooseUsername => 'Choose a username';

  @override
  String get createStrongPassword => 'Create a strong password';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get discoverRestaurants => 'Discover Restaurants';

  @override
  String get findAmazingRestaurants =>
      'Find amazing restaurants around the world by exploring different countries';

  @override
  String get searchCountries => 'Search countries...';

  @override
  String get signOut => 'Sign Out';

  @override
  String get areYouSureSignOut => 'Are you sure you want to sign out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get noCountriesFound => 'No countries found';

  @override
  String get tryAdjustingSearch =>
      'Try adjusting your search terms\nor check your spelling';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String selected(String country) {
    return 'Selected: $country';
  }

  @override
  String get clearSearchTooltip => 'Clear search';

  @override
  String get loginError => 'Login Error';

  @override
  String get registrationError => 'Registration Error';

  @override
  String get ok => 'OK';

  @override
  String get pleaseEnterUsername => 'Please enter your username';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get usernameMinLength => 'Username must be at least 3 characters';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get accountCreatedSuccessfully => 'Account created successfully!';

  @override
  String get registrationFailed => 'Registration failed. Please try again.';

  @override
  String get or => 'or';

  @override
  String restaurantsIn(String city) {
    return 'Restaurants in $city';
  }

  @override
  String get errorLoadingRestaurants => 'Error loading restaurants';

  @override
  String get checkConnectionAndTryAgain =>
      'Please check your connection and try again';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get noRestaurantsFound => 'No restaurants found';

  @override
  String get tryDifferentCityOrCheckLater =>
      'Try a different city or check back later';

  @override
  String get unknownRestaurant => 'Unknown Restaurant';

  @override
  String get address => 'Address';

  @override
  String get phone => 'Phone';

  @override
  String get openingHours => 'Opening Hours';

  @override
  String get status => 'Status';

  @override
  String get open => 'Open';

  @override
  String get closed => 'Closed';

  @override
  String get call => 'Call';

  @override
  String get directions => 'Directions';

  @override
  String get callFeatureComingSoon => 'Call feature coming soon!';

  @override
  String get directionsFeatureComingSoon => 'Directions feature coming soon!';
}
