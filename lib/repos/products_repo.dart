import 'dart:convert';
import 'package:ecommerce/models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  static Future<List<ProductsModel>> getProducts() async {
    final client = http.Client();
    List<ProductsModel> products = [];
    try {
      final response =
          await client.get(Uri.parse('https://fakestoreapi.com/products'));
      List result = jsonDecode(response.body);
      result
          .map((product) => products.add(ProductsModel.fromMap(product)))
          .toList();
      return products;
    } catch (e) {
      return [];
    }
  }
}
