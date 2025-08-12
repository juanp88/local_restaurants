// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Restaurantes Locales';

  @override
  String get welcomeBack => 'Bienvenido de Vuelta';

  @override
  String get signInToContinue =>
      'Inicia sesión para descubrir restaurantes increíbles';

  @override
  String get username => 'Usuario';

  @override
  String get enterUsername => 'Ingresa tu usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get enterPassword => 'Ingresa tu contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta?';

  @override
  String get signUp => 'Regístrate';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get joinUsToDiscover => 'Únete para descubrir restaurantes increíbles';

  @override
  String get chooseUsername => 'Elige un nombre de usuario';

  @override
  String get createStrongPassword => 'Crea una contraseña segura';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get discoverRestaurants => 'Descubre Restaurantes';

  @override
  String get findAmazingRestaurants =>
      'Encuentra restaurantes increíbles alrededor del mundo explorando diferentes países';

  @override
  String get searchCountries => 'Buscar países...';

  @override
  String get signOut => 'Cerrar Sesión';

  @override
  String get areYouSureSignOut => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get noCountriesFound => 'No se encontraron países';

  @override
  String get tryAdjustingSearch =>
      'Intenta ajustar tus términos de búsqueda\no verifica la ortografía';

  @override
  String get clearSearch => 'Limpiar Búsqueda';

  @override
  String selected(String country) {
    return 'Seleccionado: $country';
  }

  @override
  String get clearSearchTooltip => 'Limpiar búsqueda';

  @override
  String get loginError => 'Error de Inicio de Sesión';

  @override
  String get registrationError => 'Error de Registro';

  @override
  String get ok => 'OK';

  @override
  String get pleaseEnterUsername => 'Por favor ingresa tu usuario';

  @override
  String get pleaseEnterPassword => 'Por favor ingresa tu contraseña';

  @override
  String get usernameMinLength => 'El usuario debe tener al menos 3 caracteres';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get accountCreatedSuccessfully => '¡Cuenta creada exitosamente!';

  @override
  String get registrationFailed =>
      'El registro falló. Por favor intenta de nuevo.';

  @override
  String get or => 'o';

  @override
  String restaurantsIn(String city) {
    return 'Restaurantes en $city';
  }

  @override
  String get errorLoadingRestaurants => 'Error al cargar restaurantes';

  @override
  String get checkConnectionAndTryAgain =>
      'Por favor verifica tu conexión e intenta de nuevo';

  @override
  String get tryAgain => 'Intentar de Nuevo';

  @override
  String get noRestaurantsFound => 'No se encontraron restaurantes';

  @override
  String get tryDifferentCityOrCheckLater =>
      'Intenta con una ciudad diferente o vuelve más tarde';

  @override
  String get unknownRestaurant => 'Restaurante Desconocido';

  @override
  String get address => 'Dirección';

  @override
  String get phone => 'Teléfono';

  @override
  String get openingHours => 'Horarios de Atención';

  @override
  String get status => 'Estado';

  @override
  String get open => 'Abierto';

  @override
  String get closed => 'Cerrado';

  @override
  String get call => 'Llamar';

  @override
  String get directions => 'Direcciones';

  @override
  String get callFeatureComingSoon => '¡Función de llamada próximamente!';

  @override
  String get directionsFeatureComingSoon =>
      '¡Función de direcciones próximamente!';
}
