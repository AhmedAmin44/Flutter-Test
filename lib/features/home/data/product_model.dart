import 'package:interview/core/api/end_ponits.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData[ApiKey.id],
      title: jsonData[ApiKey.title],
      price: jsonData[ApiKey.price].toDouble(),
      description: jsonData[ApiKey.description],
      category: jsonData[ApiKey.category],
      image: jsonData[ApiKey.image],
      rating: Rating.fromJson(jsonData[ApiKey.rating]),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json[ApiKey.rate].toDouble(),
      count: json[ApiKey.count],
    );
  }
}