  import 'package:byteblocks/presentation/state_holders/pc_build_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
class AllFunctionClass {



void showSnackBar(BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}
Future<void> sslCommerzGeneralCall(double Price, String id) async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
         ipn_url: "https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php",
             multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Pc Parts",
        sdkType: SSLCSdkType.TESTBOX, 
        store_id: "pchou6717321b18c2c",
        store_passwd: "pchou6717321b18c2c@ssl",
        total_amount: Price,
        tran_id: id,
      ),
    );
    SSLCTransactionInfoModel result = await sslcommerz.payNow();
  paymentStatusCheck(result);
  }
  void paymentStatusCheck(SSLCTransactionInfoModel result) async {
  try {
    print("result status ::${result.status ?? ""}");

    if (result.status!.toLowerCase() == "failed") {
      Get.snackbar(
        "Transaction Failed",
        "Transaction is Failed....",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (result.status!.toLowerCase() == "closed") {
      Get.snackbar(
        "SDK Closed",
        "SDK Closed by User",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
        Get.find<PcBuildController>().clearBuild();
      Get.snackbar(
        "Transaction Success",
        "Transaction is ${result.status} and Amount is ${result.amount ?? 0}",
        backgroundColor: const Color.fromARGB(255, 10, 83, 46),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}


}