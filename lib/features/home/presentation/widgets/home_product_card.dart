import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/core/api/dio_consumer.dart';
import 'package:interview/features/home/data/product_model.dart';
import 'package:interview/features/home/data/product_repository.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/screens/product_detail_view.dart';
import 'package:interview/features/home/presentation/widgets/product_card_details.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetailScreen(context),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            ProductImage(imageUrl: product.image),
            ProductInfo(title: product.title, price: product.price),
          ],
        ),
      ),
    );
  }

  void _navigateToDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => BlocProvider(
              create:
                  (context) => ProductCubit(
                    ProductRepository(api: DioConsumer(dio: Dio())),
                  )..getProductById(product.id),
              child: ProductDetailScreen(productId: product.id),
            ),
      ),
    );
  }
}
