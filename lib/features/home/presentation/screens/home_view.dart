import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/core/api/dio_consumer.dart';
import 'package:interview/core/utils/app_string.dart';
import 'package:interview/features/home/data/product_repository.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:interview/features/home/presentation/widgets/home_content.dart';
import 'package:interview/features/home/presentation/screens/search_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().getAllProducts();
    });

    return Scaffold(
      appBar: CustomAppBar(
        isSearch: true,
        isArrow: false,
        title: AppStrings.homeView,
        onSearchPressed: () => _navigateToSearchScreen(context),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: HomeContent(),
      ),
    );
  }

  void _navigateToSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ProductCubit(
            ProductRepository(
              api: DioConsumer(dio: Dio()),
            ),
          ),
          child: const SearchScreen(),
        ),
      ),
    );
  }
}