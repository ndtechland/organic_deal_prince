//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/Home_page/home_page.dart';
import 'package:organic_deal/services/api_provider.dart';

class LoginEmailController extends GetxController {
  final getStorage = GetStorage();
  var isVisible = true.obs;
  var isLoading = true.obs;
  var isSendingData = false.obs;
  final GlobalKey<FormState> loginEmailFormKey = GlobalKey();
  final formKey = new GlobalKey<FormState>();
  TextEditingController Email = TextEditingController();
  TextEditingController PassWord = TextEditingController();

  //  var email = '';
  // var password = '';
  var Id = '';
  void emailApi() async {
  //  isLoading(true);
    isSendingData.value = true;
    http.Response r = await ApiProvider.LoginEmailApi(
      Email.text,
      PassWord.text,
    );
    if (r.statusCode == 200) {
      isSendingData.value = false;
      login();
     // isLoading(false);
     //  Get.to(() => HomePage());
    }else{
     // isLoading(true);
    }
    isSendingData.value = false;
  }
  @override
  void onInit() {
    super.onInit();
    Email;
    PassWord;
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    Email.dispose();
    PassWord.dispose();
  }

  String? validateEmail(value) {
    if (value == '') {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
      return "Password must be of 4 characters";
    }
    return null;
  }

  void checkLogin() {
    final form = formKey.currentState;
    if(form!.validate())
    {
      emailApi();
      print ('Form is valid');
    }
    else
    {
      print('form is invalid');
    }
  }
  login(){
    getStorage.write("id", 1);
    getStorage.write("name"," Rahul Kumar");
    Get.to(() => HomePage());
  }
}
