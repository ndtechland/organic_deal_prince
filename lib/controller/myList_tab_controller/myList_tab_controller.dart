import 'package:get/get.dart';

class MyListTabController extends GetxController {

  // It is mandatory initialize with one value from listType
  var selectedDrowpdown = '100 ml'.obs;
  List dropdownText = ['100 ml', '200 ml', '400 ml'];
  // Add button hide
   var isButtonHide = true.obs;
   @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }
}
