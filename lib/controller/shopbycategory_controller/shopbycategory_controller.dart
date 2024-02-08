import 'package:get/get.dart';
import 'package:organic_deal/model/shopbycategory_model.dart';
import 'package:organic_deal/services/api_provider.dart';

class ShopByCategoryController extends GetxController{
  RxBool isloading = true.obs;
  ShopByCategory?  shopbycategorylist;

  void shopByCategoryApi() async{
    isloading(true);
    shopbycategorylist = await ApiProvider.ShopbyCategoryApi();
    if(shopbycategorylist != null){
      isloading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    shopByCategoryApi();
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