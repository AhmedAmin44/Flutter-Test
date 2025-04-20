import 'package:dartz/dartz.dart';
import 'package:interview/core/api/api_consumer.dart';
import 'package:interview/core/api/end_ponits.dart';
import 'package:interview/core/errors/exceptions.dart';
import 'package:interview/features/home/data/product_model.dart';


class ProductRepository {
  final ApiConsumer api;

  ProductRepository({required this.api});

  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await api.get(EndPoint.products);
      final products = List<ProductModel>.from(
          response.map((product) => ProductModel.fromJson(product)));
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, ProductModel>> getProductById(int id) async {
    try {
      final response = await api.get(EndPoint.singleProduct(id));
      return Right(ProductModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, List<ProductModel>>> searchProducts(String query) async {
    try {
      final response = await api.get(EndPoint.products);
      final allProducts = List<ProductModel>.from(
          response.map((product) => ProductModel.fromJson(product)));
      final filteredProducts = allProducts
          .where((product) =>
              product.title.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return Right(filteredProducts);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
  
}