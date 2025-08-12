import 'dart:math';
import '../models/restaurant.dart';

class RestaurantService {
  // static const String _baseUrl = 'https://overpass-api.de/api/interpreter'; // For future API integration

  // Mock data for demonstration - in a real app, you'd use a proper API
  static final List<Restaurant> _mockRestaurants = [
    Restaurant(
      id: '1',
      name: 'La Bella Vista',
      address: '123 Main Street',
      cuisine: 'Italian',
      rating: 4.5,
      priceRange: '\$\$',
      phoneNumber: '+1-555-0123',
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400',
      isOpen: true,
      openingHours: '11:00 AM - 10:00 PM',
    ),
    Restaurant(
      id: '2',
      name: 'Sakura Sushi',
      address: '456 Oak Avenue',
      cuisine: 'Japanese',
      rating: 4.8,
      priceRange: '\$\$\$',
      phoneNumber: '+1-555-0456',
      imageUrl:
          'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400',
      isOpen: true,
      openingHours: '5:00 PM - 11:00 PM',
    ),
    Restaurant(
      id: '3',
      name: 'Burger Palace',
      address: '789 Pine Road',
      cuisine: 'American',
      rating: 4.2,
      priceRange: '\$',
      phoneNumber: '+1-555-0789',
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
      isOpen: false,
      openingHours: '12:00 PM - 9:00 PM',
    ),
    Restaurant(
      id: '4',
      name: 'Spice Garden',
      address: '321 Elm Street',
      cuisine: 'Indian',
      rating: 4.6,
      priceRange: '\$\$',
      phoneNumber: '+1-555-0321',
      imageUrl:
          'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400',
      isOpen: true,
      openingHours: '11:30 AM - 10:30 PM',
    ),
    Restaurant(
      id: '5',
      name: 'Le Petit Bistro',
      address: '654 Maple Lane',
      cuisine: 'French',
      rating: 4.7,
      priceRange: '\$\$\$',
      phoneNumber: '+1-555-0654',
      imageUrl:
          'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
      isOpen: true,
      openingHours: '6:00 PM - 11:00 PM',
    ),
    Restaurant(
      id: '6',
      name: 'Taco Fiesta',
      address: '987 Cedar Boulevard',
      cuisine: 'Mexican',
      rating: 4.3,
      priceRange: '\$',
      phoneNumber: '+1-555-0987',
      imageUrl:
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400',
      isOpen: true,
      openingHours: '10:00 AM - 11:00 PM',
    ),
  ];

  Future<List<Restaurant>> getRestaurantsByCity(
      String cityName, String countryName) async {
    try {
      // For demonstration, we'll return mock data with some variation based on the city
      // In a real app, you would make an API call here

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 1500));

      // Return a randomized subset of mock restaurants
      final random = Random();
      final shuffled = List<Restaurant>.from(_mockRestaurants)..shuffle(random);
      final count = 3 + random.nextInt(4); // Return 3-6 restaurants

      // Customize restaurant names based on the city for more realistic feel
      return shuffled.take(count).map((restaurant) {
        return Restaurant(
          id: restaurant.id,
          name: _localizeRestaurantName(restaurant.name!, cityName),
          address: '${restaurant.address}, $cityName',
          cuisine: restaurant.cuisine,
          rating: restaurant.rating,
          priceRange: restaurant.priceRange,
          phoneNumber: restaurant.phoneNumber,
          imageUrl: restaurant.imageUrl,
          isOpen: restaurant.isOpen,
          openingHours: restaurant.openingHours,
        );
      }).toList();
    } catch (e) {
      print('Error fetching restaurants: $e');
      return [];
    }
  }

  String _localizeRestaurantName(String originalName, String cityName) {
    // Add some city-specific flavor to restaurant names
    final cityPrefixes = {
      'Paris': ['Chez ', 'Le ', 'La '],
      'Tokyo': ['', 'Tokyo ', ''],
      'London': ['The ', '', 'Royal '],
      'Madrid': ['El ', 'La ', 'Casa '],
      'Rome': ['Trattoria ', 'Osteria ', 'Ristorante '],
      'Berlin': ['Zur ', 'Das ', ''],
      'Amsterdam': ['De ', 'Het ', ''],
    };

    final prefixes = cityPrefixes[cityName] ?? ['', '', ''];
    final random = Random();
    final prefix = prefixes[random.nextInt(prefixes.length)];

    return '$prefix$originalName';
  }

  // Future method for real API integration (commented out for now)
  /*
  Future<List<Restaurant>> _fetchFromOverpassAPI(String cityName) async {
    final query = '''
    [out:json][timeout:25];
    (
      node["amenity"="restaurant"]["addr:city"="$cityName"];
      way["amenity"="restaurant"]["addr:city"="$cityName"];
      relation["amenity"="restaurant"]["addr:city"="$cityName"];
    );
    out geom;
    ''';

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'data=$query',
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final elements = data['elements'] as List;
        
        return elements.map((element) {
          final tags = element['tags'] as Map<String, dynamic>? ?? {};
          return Restaurant(
            id: element['id']?.toString(),
            name: tags['name']?.toString() ?? 'Unknown Restaurant',
            address: _buildAddress(tags),
            cuisine: tags['cuisine']?.toString() ?? 'Various',
            phoneNumber: tags['phone']?.toString(),
            latitude: element['lat']?.toDouble(),
            longitude: element['lon']?.toDouble(),
            openingHours: tags['opening_hours']?.toString(),
          );
        }).toList();
      }
    } catch (e) {
      print('Error fetching from Overpass API: $e');
    }
    
    return [];
  }

  String _buildAddress(Map<String, dynamic> tags) {
    final parts = <String>[];
    if (tags['addr:housenumber'] != null) parts.add(tags['addr:housenumber']);
    if (tags['addr:street'] != null) parts.add(tags['addr:street']);
    if (tags['addr:city'] != null) parts.add(tags['addr:city']);
    return parts.join(', ');
  }
  */
}
