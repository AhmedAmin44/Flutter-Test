import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/cubit/home_state.dart';
import 'package:interview/features/home/presentation/widgets/home_product_grid.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

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
          return ProductGrid(products: state.products);
        }
        return const Center(child: Text('Search for products'));
      },
    );
  }
}