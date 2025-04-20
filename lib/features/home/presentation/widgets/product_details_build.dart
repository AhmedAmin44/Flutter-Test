import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/cubit/home_state.dart';
import 'package:interview/features/home/presentation/widgets/product_details_content.dart';

class ProductDetailBuilder extends StatelessWidget {
  final int productId;

  const ProductDetailBuilder({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductDetailLoading) {
          return const Center(child: CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 2.0,
          ));
        } else if (state is ProductDetailFailure) {
          return Center(child: Text(state.error));
        } else if (state is ProductDetailLoaded) {
          return ProductDetailContent(product: state.product);
        }
        return const Center(child: Text('Product not found'));
      },
    );
  }
}
