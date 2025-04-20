import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/features/home/data/product_model.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/cubit/home_state.dart';
import 'package:interview/features/home/presentation/widgets/home_product_card.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2.0,
                    ));
        } else if (state is ProductFailure) {
          return Center(child: Text(state.error));
        } else if (state is ProductLoaded) {
          return ProductGrid(products: state.products);
        }
        return const Center(
          child: Text(
            'No products available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontFamily: 'Roboto',
            ),
          ),
        );
      },
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.h,
        mainAxisSpacing: 15.w,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
