import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/features/home/data/product_model.dart';
import 'package:interview/features/home/data/product_repository.dart';
import 'package:interview/features/home/presentation/cubit/home_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());

  List<ProductModel> products = [];

  Future<void> getAllProducts() async {
    emit(ProductLoading());
    final response = await productRepository.getAllProducts();
    response.fold(
      (error) => emit(ProductFailure(error)),
      (products) {
        this.products = products;
        emit(ProductLoaded(products: products));
      },
    );
  }

  Future<void> getProductById(int id) async {
    emit(ProductDetailLoading());
    final response = await productRepository.getProductById(id);
    response.fold(
      (error) => emit(ProductDetailFailure(error)),
      (product) => emit(ProductDetailLoaded(product: product)),
    );
  }

  Future<void> searchProducts(String query) async {
    emit(ProductLoading());
    final response = await productRepository.searchProducts(query);
    response.fold(
      (error) => emit(ProductFailure(error)),
      (products) => emit(ProductLoaded(products: products)),
    );
  }
  
}