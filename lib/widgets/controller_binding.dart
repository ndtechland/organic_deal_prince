import 'package:get/get.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/hometab_controller/hometab_controller.dart';
import 'package:organic_deal/controller/specialProduct_controller/specialProduct_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeTabController());
    Get.put(SpecialProductController());
    Get.put(CartListApiController());
  }

}