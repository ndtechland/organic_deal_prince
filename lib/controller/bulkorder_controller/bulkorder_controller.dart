//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/services/api_provider.dart';

class BulkOrderController extends GetxController {
  final GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();
  TextEditingController Fullname = TextEditingController();
  TextEditingController CompanyName = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController Pincode = TextEditingController();
  TextEditingController Message = TextEditingController();

  void signupApi() async {
    RxBool isloading = true.obs;
    http.Response r = await ApiProvider.registerApi(
      Fullname.text,
      CompanyName.text,
      Phone.text,
      Email.text,
      Address.text,
      City.text,
      State.text,
      Pincode.text,
      Message.text,
    );
    if (r.statusCode == 200) {
      isloading(false);
      Get.snackbar('Success', 'Registration SuccessFully');
     // _loginMobileController.login();
     // Get.to(() => HomePage());
    }
  }
  @override
  void onInit() {
    super.onInit();
    Fullname;
    CompanyName;
    Phone;
    Email;
    Address;
    City;
    State;
    Pincode;
    Message;
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
  String? validateName(String value) {
    if (value.length < 2) {
      return "Name should must be 2 characters";
    }
    return null;
  }
  String? validatemobile(String value) {
    if (value.length < 10) {
      return "Provide valid Phone";
    }
    return null;
  }

  String? validateShopname(String value) {
    if (value.length < 3) {
      return "Provide valid ShopName";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "provide valid address";
    }
    return null;
  }

  String? validateaadharcard(String value) {
    if (value.length < 12) {
      return "Provide valid aadhar";
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.length < 5) {
      return "Provide valid password";
    }
    return null;
  }

  void checkLogin() {
    // final isValid = SignupFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
   // SignupFormKey.currentState!.save();
    signupApi();
  }
}
