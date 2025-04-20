class EndPoint {
   static const String baseUrl = 'https://fakestoreapi.com';
  static const String products = '$baseUrl/products';
  static String singleProduct(int id) => '$baseUrl/products/$id';
   static String productsByCategory(String category) => '$products/category/$category';
  static const String categories = '$products/categories';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String id='id';
  static String title='title';
  static String price='price';
  static String description='description';
  static String category='category';
  static String image='image';
  static String rating='rating';
  static String rate='rate';
  static String count='count';
}
