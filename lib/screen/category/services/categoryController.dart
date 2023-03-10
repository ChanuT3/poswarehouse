import 'package:flutter/material.dart';
import 'package:poswarehouse/models/allTypeProduct.dart';
import 'package:poswarehouse/models/typeProduct.dart';
import 'package:poswarehouse/screen/category/services/categoryApi.dart';

import '../../../models/subCategory.dart';

class CategoryController extends ChangeNotifier {
  CategoryController({this.api = const CategoryApi()});

  CategoryApi api;

  List<TypeProduct>? allTypeProduct;
  TypeProduct? nameCategory;
  List<SubCategory>? getCategoryId;

  getListCategorys() async {
    // products = await ProductApi.getProducts();
    allTypeProduct = await CategoryApi.getCategorys();
    notifyListeners();
  }

  //ซื้อสินค้าผ่าน SCB และพร้มเพย์
  accountBank() async {
    allTypeProduct?.clear();
    allTypeProduct = await CategoryApi.getCategorys();

    notifyListeners();
  }

  newCategoryCreate(String name) async {
    nameCategory = await CategoryApi.crateCategorys(name);
    notifyListeners();
  }

  getCategoryById(int? id) async {
    getCategoryId = (await CategoryApi.getCategorysById(id)).sub_categorys;
    notifyListeners();
  }
}
