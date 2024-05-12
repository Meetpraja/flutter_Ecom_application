import 'package:ecom/ProductModel.dart';
import 'package:flutter/material.dart';

import 'DioClient.dart';

class Products extends ChangeNotifier{

  List<ProductModel> list = [];
  List<ProductModel> get _list => list ;

  void fetchProductList() async{
    list = await DioClient().getAllProduct();
    notifyListeners();

  }

}