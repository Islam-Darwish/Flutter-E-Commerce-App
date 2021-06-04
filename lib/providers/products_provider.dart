import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _productsList = [];
  Future<bool> getProductsList() async {
    var dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
    var res = await dio.get('/products');
    if (res.statusCode! < 400) {
      var data = res.data as List<dynamic>;
      _productsList = data.map((i) => Product.fromJson(i)).toList();
      return true;
    }
    return false;
  }

  List<Product> get productsList => [..._productsList];

  Future<Product?> getProductById(int id) async {
    try {
      return _productsList.firstWhere(
        (element) => element.id == id,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Product?> getProductByIndex(int index) async {
    if (index < 0 || index >= _productsList.length)
      return null;
    else
      return _productsList[index];
  }

  int getProductIndex(Product product) {
    return _productsList.indexWhere((element) => element.id == product.id);
  }
}
