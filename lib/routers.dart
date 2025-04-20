import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/core/api/dio_consumer.dart';
import 'package:interview/features/home/data/product_repository.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/screens/home_view.dart';
import 'package:interview/features/splash/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashView()),
    GoRoute(
  path: "/home",  
  builder: (context, state) {
    
    return BlocProvider(
      create: (context) => ProductCubit(
        ProductRepository(
          api: DioConsumer(dio: Dio()),
        ),
      )..getAllProducts(),  
      child: HomeScreen(),
    );
  },
),
   
  ],
);
