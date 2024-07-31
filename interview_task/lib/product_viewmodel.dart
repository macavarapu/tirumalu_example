import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/product_detail_res.dart';
import 'models/product_list_res.dart';

class ProductViewModel extends ChangeNotifier {
  List<Products> productsList = [];
  ProductDetailsRes? productDetails;

  Future<void> products() async {
    final response = await Dio().get('https://dummyjson.com/products');
    print('products list res $response');
    if (response.statusCode == 200) {
      final result = ProductRes.fromJson(response.data);
      productsList = result.products!;
      print('products list res $result');
    }
    notifyListeners();
  }

  Future<void> productsDetail(int? productId) async {
    final response =
        await Dio().get('https://dummyjson.com/products/$productId');
    if (response.statusCode == 200) {
      final result = ProductDetailsRes.fromJson(response.data);
      productDetails = result;
    }
    notifyListeners();
  }
}
