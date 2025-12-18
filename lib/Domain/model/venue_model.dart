import 'dart:convert';

class VenueModel {
  final int id;
  final String name;
  final String address;
  final double kilometres;
  final String logo;
  final double rating;
  final List<String> sports;
  final int favourite;
  final int featured;
  final Map<String, int> price;

  VenueModel({
    required this.id,
    required this.name,
    required this.address,
    required this.kilometres,
    required this.logo,
    required this.rating,
    required this.sports,
    required this.favourite,
    required this.featured,
    required this.price,
  });

  // Factory constructor for creating a VenueModel from JSON
  factory VenueModel.fromJson(Map<String, dynamic> json) {
    return VenueModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      // Handles both int and double from JSON
      kilometres: (json['kilometres'] as num).toDouble(),
      logo: json['logo'],
      rating: (json['rating'] as num).toDouble(),
      sports: List<String>.from(json['sports']),
      favourite: json['favourite'],
      featured: json['featured'],
      // Maps the dynamic price keys to a Map<String, int>
      price: Map<String, int>.from(json['price']),
    );
  }

  // Method to convert VenueModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'kilometres': kilometres,
      'logo': logo,
      'rating': rating,
      'sports': sports,
      'favourite': favourite,
      'featured': featured,
      'price': price,
    };
  }
}

// Helper function to parse a list of VenueModels
// ignore: non_constant_identifier_names
List<VenueModel> VenueModelListFromJson(String str) =>
    List<VenueModel>.from(json.decode(str).map((x) => VenueModel.fromJson(x)));
