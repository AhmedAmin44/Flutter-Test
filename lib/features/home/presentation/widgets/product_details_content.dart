import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/core/utils/app_colors.dart';
import 'package:interview/features/home/data/product_model.dart';

class ProductDetailContent extends StatelessWidget {
  final ProductModel product;

  const ProductDetailContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailImage(imageUrl: product.image),
          ProductTitle(title: product.title),

          ProductPrice(price: product.price
          ,rate: product.rating.rate, count: product.rating.count),

          ProductCategory(category: product.category),
          const SectionTitle(title: 'Description:'),
          ProductDescription(description: product.description),
        ],
      ),
    );
  }
}

// Product Image Widget
class ProductDetailImage extends StatelessWidget {
  final String imageUrl;

  const ProductDetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Container(
        padding: const EdgeInsets.all(8.0),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: Image.network(
          imageUrl,
          width: double.infinity.w,
          height: 300.h,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error, size: 100),
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String title;

  const ProductTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final double price;
final double rate;
  final int count;
  const ProductPrice({super.key, required this.price, required this.rate, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${price.toStringAsFixed(2)}',
          style:  TextStyle(
            fontSize: 20,
            color: AppColors.secondColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      
      Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text(
          '$rate ($count reviews)',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    )
      ],
    );
  }
}

// Product Category Widget
class ProductCategory extends StatelessWidget {
  final String category;

  const ProductCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        category.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Product Description Widget
class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 16),
    );
  }
}

