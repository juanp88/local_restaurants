class Restaurant {
  final String? id;
  final String? name;
  final String? address;
  final String? cuisine;
  final double? rating;
  final String? priceRange;
  final String? phoneNumber;
  final String? imageUrl;
  final double? latitude;
  final double? longitude;
  final bool? isOpen;
  final String? openingHours;

  Restaurant({
    this.id,
    this.name,
    this.address,
    this.cuisine,
    this.rating,
    this.priceRange,
    this.phoneNumber,
    this.imageUrl,
    this.latitude,
    this.longitude,
    this.isOpen,
    this.openingHours,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      address: json['address']?.toString(),
      cuisine: json['cuisine']?.toString(),
      rating: json['rating']?.toDouble(),
      priceRange: json['price_range']?.toString(),
      phoneNumber: json['phone']?.toString(),
      imageUrl: json['image_url']?.toString(),
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      isOpen: json['is_open'] as bool?,
      openingHours: json['opening_hours']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'cuisine': cuisine,
      'rating': rating,
      'price_range': priceRange,
      'phone': phoneNumber,
      'image_url': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'is_open': isOpen,
      'opening_hours': openingHours,
    };
  }
}
