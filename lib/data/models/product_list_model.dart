import 'package:byteblocks/data/models/product_model.dart';

class ProductListModel {
  int? statusCode;
  bool? success;
  String? message;
  List<ProductModel>? data;

  ProductListModel({this.statusCode, this.success, this.message, this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data']?.forEach((v) {
        data!.add(ProductModel.fromJson(v));
      });
    }
  }


}

