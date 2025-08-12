import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Local Restaurants'**
  String get appTitle;

  /// Welcome message on login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// Subtitle on login screen
  ///
  /// In en, this message translates to:
  /// **'Sign in to discover amazing restaurants'**
  String get signInToContinue;

  /// Username field label
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Username field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get enterUsername;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Password field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// Forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// Sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Text before sign up link
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Sign up link text
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Create account title
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Subtitle on register screen
  ///
  /// In en, this message translates to:
  /// **'Join us to discover amazing restaurants'**
  String get joinUsToDiscover;

  /// Username field hint on register
  ///
  /// In en, this message translates to:
  /// **'Choose a username'**
  String get chooseUsername;

  /// Password field hint on register
  ///
  /// In en, this message translates to:
  /// **'Create a strong password'**
  String get createStrongPassword;

  /// Text before sign in link
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Main title on search page
  ///
  /// In en, this message translates to:
  /// **'Discover Restaurants'**
  String get discoverRestaurants;

  /// Subtitle on search page
  ///
  /// In en, this message translates to:
  /// **'Find amazing restaurants around the world by exploring different countries'**
  String get findAmazingRestaurants;

  /// Search bar placeholder
  ///
  /// In en, this message translates to:
  /// **'Search countries...'**
  String get searchCountries;

  /// Sign out button text
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Sign out confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get areYouSureSignOut;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Empty state title
  ///
  /// In en, this message translates to:
  /// **'No countries found'**
  String get noCountriesFound;

  /// Empty state subtitle
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search terms\nor check your spelling'**
  String get tryAdjustingSearch;

  /// Clear search button text
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// Selected country message
  ///
  /// In en, this message translates to:
  /// **'Selected: {country}'**
  String selected(String country);

  /// Clear search button tooltip
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearchTooltip;

  /// Login error dialog title
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get loginError;

  /// Registration error dialog title
  ///
  /// In en, this message translates to:
  /// **'Registration Error'**
  String get registrationError;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Username validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get pleaseEnterUsername;

  /// Password validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// Username minimum length validation
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters'**
  String get usernameMinLength;

  /// Password minimum length validation
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// Success message after registration
  ///
  /// In en, this message translates to:
  /// **'Account created successfully!'**
  String get accountCreatedSuccessfully;

  /// Registration failure message
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationFailed;

  /// Divider text between sections
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// Title for restaurants page
  ///
  /// In en, this message translates to:
  /// **'Restaurants in {city}'**
  String restaurantsIn(String city);

  /// Error message when restaurants fail to load
  ///
  /// In en, this message translates to:
  /// **'Error loading restaurants'**
  String get errorLoadingRestaurants;

  /// Error message subtitle
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again'**
  String get checkConnectionAndTryAgain;

  /// Try again button text
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Empty state message for restaurants
  ///
  /// In en, this message translates to:
  /// **'No restaurants found'**
  String get noRestaurantsFound;

  /// Empty state subtitle for restaurants
  ///
  /// In en, this message translates to:
  /// **'Try a different city or check back later'**
  String get tryDifferentCityOrCheckLater;

  /// Fallback restaurant name
  ///
  /// In en, this message translates to:
  /// **'Unknown Restaurant'**
  String get unknownRestaurant;

  /// Address label
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Phone label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Opening hours label
  ///
  /// In en, this message translates to:
  /// **'Opening Hours'**
  String get openingHours;

  /// Status label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Open status
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Closed status
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// Call button text
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// Directions button text
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// Coming soon message for call feature
  ///
  /// In en, this message translates to:
  /// **'Call feature coming soon!'**
  String get callFeatureComingSoon;

  /// Coming soon message for directions feature
  ///
  /// In en, this message translates to:
  /// **'Directions feature coming soon!'**
  String get directionsFeatureComingSoon;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
