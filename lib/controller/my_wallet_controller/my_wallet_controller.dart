import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_deal/model/wallet/getWalletAmountModel.dart';
import 'package:organic_deal/services/api_provider.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
enum chooseAddress { i, h, f, o, t }

class MyWalletController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<chooseAddress> selectedAddress = chooseAddress.i.obs;
  GetWalletAmountModel getWalletAmountModel = Get.put(GetWalletAmountModel());
  TextEditingController textEditingController = TextEditingController();
  // RxString selectedGender = 100.obs;
  // chooseAddress.i.obs as RxString;

  // final count = 0.obs;
  // increment() => count.value++;
  Future<int> postWalletAmountApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.AddWallet(textEditingController.text);
    if (r.statusCode == 200) {
      isLoading(false);
    }
    return r.statusCode;
  }

  // get wallet amount api...
  void getWalletAmountApi() async {
    isLoading(true);
    getWalletAmountModel = await ApiProvider.getWalletAmount();
    if (getWalletAmountModel != null) {
      var bool = isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getWalletAmountApi();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
