import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/core/api/dio_consumer.dart';
import 'package:interview/features/home/data/product_model.dart';
import 'package:interview/features/home/data/product_repository.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/screens/product_detail_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductCarousel extends StatefulWidget {
  final List<ProductModel> products;
  final double height;
  final double borderRadius;

  const ProductCarousel({
    super.key,
    required this.products,
    this.height = 180,
    this.borderRadius = 16,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount: widget.products.length,
          options: CarouselOptions(
            height: widget.height,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final product = widget.products[index];
            return GestureDetector(
              onTap: () {
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
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),

        // Smooth Page Indicator
        Positioned(
          left: 0,
          right: 0,
          bottom: -1,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 7,
              effect:  ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.blueGrey,
                dotColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}