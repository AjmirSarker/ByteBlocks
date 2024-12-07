import 'package:byteblocks/data/models/network_response.dart';
import 'package:byteblocks/data/models/product_list_model.dart';
import 'package:byteblocks/data/models/product_model.dart';
import 'package:byteblocks/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<ProductModel> _productList = [];

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  List<ProductModel> get products => _productList;

  Future<bool> getProductList(String Url) async {
    _inProgress = true;
    bool isSuccess = false;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Url);

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _productList = ProductListModel.fromJson(response.responserData).data ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
