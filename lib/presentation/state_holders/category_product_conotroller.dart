
import 'package:byteblocks/data/models/network_response.dart';
import 'package:byteblocks/data/models/product_list_model.dart';
import 'package:byteblocks/data/models/product_model.dart';
import 'package:byteblocks/data/network_caller/network_caller.dart';
import 'package:get/get.dart';


class CategoryProductController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<ProductModel> _categoryProductList = [];

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  List<ProductModel> get categoryProducts => _categoryProductList;

  Future<bool> getCategoryProducts(String url) async {
     _categoryProductList.clear();
    _inProgress = true;
    // Clear previous data
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: url);

    if (response.isSuccess) {
      _errorMessage = null;
      _categoryProductList = ProductListModel.fromJson(response.responserData).data ?? [];
      print('Products loaded: ${_categoryProductList.length}');
    } else {
      _errorMessage = response.errorMessage;
      print('Error loading products: $_errorMessage');
    }

    _inProgress = false;
    update();
    return response.isSuccess; // Return whether the fetch was successful
  }

  Future<void> clearCategoryProducts() async {
    _categoryProductList.clear();
    update();
  }
}

