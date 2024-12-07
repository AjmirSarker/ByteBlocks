import 'package:byteblocks/data/models/network_response.dart';
import 'package:byteblocks/data/models/product_model.dart';
import 'package:byteblocks/data/models/single_product_model.dart';
import 'package:byteblocks/data/network_caller/network_caller.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  ProductModel? _singleProduct;

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  ProductModel? get singleProduct => _singleProduct;

  Future<bool> getProduct(String url) async {
    // if (_inProgress) return false;  // Prevent re-fetching while already in progress
//meow
    _inProgress = true;
    bool isSuccess = false;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: url);

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;

      if (response.responserData is Map<String, dynamic>) {
        final SingleProduct singleProductResponse = SingleProduct.fromJson(response.responserData as Map<String, dynamic>);
        _singleProduct = singleProductResponse.data;
      } else {
        _errorMessage = "Unexpected response format";
      }
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();  // Mark this as needing to rebuild after data is fetched
    return isSuccess;
  }
}
