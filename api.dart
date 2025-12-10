import 'package:dio/dio.dart';
import 'package:flutter_application_1/Model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var res = await dio.get('https://fakestoreapi.com/products');

    if (res.statusCode == 200) {
      List data = res.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Không tải được dữ liệu");
    }
  }
}

var test_api = API();
