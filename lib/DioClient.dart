import 'package:dio/dio.dart';
import 'package:ecom/ProductModel.dart';

class DioClient {
  final Dio dio = Dio();
  final baseurl = 'https://fakestoreapi.com';
  Future<List<ProductModel>> getAllProduct() async {
    var responce = await dio.get('$baseurl/products');
    print(responce.data);

    var productList1 = responce.data as List;
    return productList1.map((e) =>ProductModel.fromJson(e)).toList();
  }



}
