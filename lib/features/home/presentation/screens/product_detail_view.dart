import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/core/utils/app_string.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:interview/features/home/presentation/widgets/product_details_build.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.detailsView,
        isSearch: false,
        isArrow: true,
        onSearchPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ProductDetailBuilder(productId: widget.productId),
    );
  }
}
