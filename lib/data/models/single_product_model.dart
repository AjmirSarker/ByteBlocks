import 'package:byteblocks/data/models/product_model.dart';

class SingleProduct {
  int? statusCode;
  bool? success;
  String? message;
  ProductModel? data;

  SingleProduct({this.statusCode, this.success, this.message, this.data});

  SingleProduct.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  ProductModel.fromJson(json['data']) : null;
  }
  


}


