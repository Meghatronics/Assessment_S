import 'package:flutter/material.dart';

class Passenger {
  final String name;
  final String id;
  final ImageProvider image;

  bool onTrip = false;

  Passenger({
    required this.name,
    required this.id,
    required String imageUrl,
  }) : image = NetworkImage(imageUrl);

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}
