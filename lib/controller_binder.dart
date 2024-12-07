import 'package:byteblocks/data/network_caller/network_caller.dart';
import 'package:byteblocks/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:byteblocks/presentation/state_holders/category_product_conotroller.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';
import 'package:byteblocks/presentation/state_holders/password_controller.dart';
import 'package:byteblocks/presentation/state_holders/pc_build_controller.dart';
import 'package:byteblocks/presentation/state_holders/product_list_controller.dart';
import 'package:byteblocks/presentation/state_holders/single_product_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings  {

  @override
  void dependencies(){
    Get.put( Logger());
Get.put(NetworkCaller(logger : Get.find<Logger>()));
Get.put(BottomNavbarController());
Get.put(PasswordViewController());
Get.put(ProductListController());
Get.put(SingleProductController());
Get.put(CategoryProductController());

Get.put(PcBuildController());
Get.put(EmailSaveController());


  }
}