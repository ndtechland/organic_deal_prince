import 'package:get/get.dart';
import 'package:organic_deal/model/shopbycategory_model.dart';


import 'package:organic_deal/services/api_provider.dart';

class CategoryTabBottomController extends GetxController{
  RxBool isLoading = true.obs;
 ShopByCategory? getcategorytab;

  void categoryTabApi() async {
    isLoading(true);
    getcategorytab = await ApiProvider.CategoryTabApi();
    if (getcategorytab != null) {
      isLoading(false);
    }else{
      print("error");
    }
  }
  @override
  void onInit() {
    super.onInit();
    categoryTabApi();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void dispose() {
    super.dispose();
  }
}