//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/services/api_provider.dart';

class SignupController extends GetxController {
  var isVisible = false.obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();
  TextEditingController Fullname = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Otp = TextEditingController();

  void signupApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.registerApi1(
        Fullname.text, Phone.text, Email.text, Password.text);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  // verify otp
  void verifyOtpApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.verifyOtp(Phone.text, Otp.text);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Fullname;
    Phone;
    Email;
    Password;
    Otp;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
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

  void checkSignup() {
    final form = SignupFormKey.currentState;
    if (form!.validate()) {
      signupApi();
      isVisible.value = !isVisible.value;
    } else {}
    //  SignupFormKey.currentState!.save();
  }

  void checkSignupOtp() {
    final form = SignupFormKey.currentState;
    if (form!.validate()) {
      verifyOtpApi();
    } else {}
    //  SignupFormKey.currentState!.save();
  }
}
