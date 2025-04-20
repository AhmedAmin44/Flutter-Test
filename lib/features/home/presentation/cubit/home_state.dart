
import 'package:interview/features/home/data/product_model.dart';

abstract class ProductState {}
class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded({required this.products});
}

class ProductFailure extends ProductState {
  final String error;
  ProductFailure(this.error);
}

class ProductDetailLoading extends ProductState {}

class ProductDetailLoaded extends ProductState {
  final ProductModel product;
  ProductDetailLoaded({required this.product});
}

class ProductDetailFailure extends ProductState {
  final String error;
  ProductDetailFailure(this.error);
}
