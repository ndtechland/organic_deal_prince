import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/services/api_provider.dart';
enum chooseAddress { i,home, office, other }

class AddNewAddressController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<chooseAddress> selectedAddress = chooseAddress.i.obs;
  TextEditingController? fname,lname,phone,houseno,apartmentname,street,landmark,district,pin,nickName;
  void addNewAddressApi() async{
    isLoading(true);
    http.Response r = await ApiProvider.AddAddress(
        fname?.text,lname?.text,phone?.text,houseno?.text,apartmentname?.text,street?.text,landmark?.text,
        district?.text,pin?.text,
        selectedAddress.value.toString());
      if(r.statusCode == 200){
        isLoading(false);
      }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fname = TextEditingController();
    lname = TextEditingController();
    phone = TextEditingController();
    houseno = TextEditingController();
    apartmentname = TextEditingController();
    street = TextEditingController();
    landmark = TextEditingController();
    district = TextEditingController();
    pin = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
