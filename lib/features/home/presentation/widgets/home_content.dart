import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/features/home/data/product_model.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/cubit/home_state.dart';
import 'package:interview/features/home/presentation/widgets/home_product_carsouse.dart';
import 'package:interview/features/home/presentation/widgets/home_product_grid.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 2.0,
            ),
          );
        } else if (state is ProductFailure) {
          return Center(child: Text(state.error));
        } else if (state is ProductLoaded) {
          return Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProductCarouselSection(),
              ProductGridSection(),
            ],
          );
        }
        return const Center(child: Text('No products available'));
      },
    );
  }
}

class ProductCarouselSection extends StatelessWidget {
  const ProductCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.select(
      (ProductCubit cubit) => cubit.state is ProductLoaded
          ? (cubit.state as ProductLoaded).products
          : <ProductModel>[],
    );

    return ProductCarousel(products: products);
  }
}

class ProductGridSection extends StatelessWidget {
  const ProductGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Products",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16.h),
          const Expanded(child: ProductGridBuilder()),
        ],
      ),
    );
  }
}