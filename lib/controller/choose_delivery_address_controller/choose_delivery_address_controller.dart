import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_deal/model/address_select_model.dart';
import 'package:organic_deal/services/api_provider.dart';

class ChooseDeliveryAddressController extends GetxController{
  RxBool isLoading = false.obs;
  Rx<int> isSelected = 0.obs;
  AddressSelectModel? getaddressSelectModel;
  void toggle(int index) {
    isSelected.value = index;
    update();
  }
  void getDeliveryAddressApi()async{
    isLoading(true);
    getaddressSelectModel = await ApiProvider.DeliveryAddressSelectApi();
    if(getaddressSelectModel?.getDeliverAddress !=null){
      isLoading(false);
  }
}
  final txtList = TextEditingController();

  RxString controllerText = ''.obs;
  @override
  void onInit() {
    txtList.addListener(() {
      controllerText.value = txtList.text;
    });

    debounce(controllerText, (_) {
      print("debouce$_");
    }, time: Duration(seconds: 1));
    // TODO: implement onInit
    getDeliveryAddressApi();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}