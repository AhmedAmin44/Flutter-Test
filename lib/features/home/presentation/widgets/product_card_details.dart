import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/core/utils/app_colors.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          width: double.infinity.w,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

// Product Info Widget
class ProductInfo extends StatelessWidget {
  final String title;
  final double price;

  const ProductInfo({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle( fontSize: 14.sp,
            color: AppColors.darkGrey
            ),
          ),
           SizedBox(height: 4.h),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style:  TextStyle(
              color: AppColors.secondColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
