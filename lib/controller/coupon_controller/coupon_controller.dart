import 'package:get/get.dart';
import 'package:organic_deal/model/couponList_model.dart';
import 'package:organic_deal/model/subTotal_model.dart';
import 'package:organic_deal/services/api_provider.dart';
import 'package:http/http.dart' as http;
class CouponController extends GetxController{
  RxBool isLoading = false.obs;
  CouponListModel? getCouponListModel;
  SubTotalModel? getSubTotalModel;

  void getCouponListApi() async{
    isLoading(true);
    getCouponListModel = await ApiProvider.CouponListApi();
    if(getCouponListModel?.result != null){
      isLoading(false);
    }
  }
  void CouponApply(var couponCode)async{
    isLoading(true);
    http.Response r = await ApiProvider.applyCoupon(couponCode);
    if(r.statusCode== 200){
      Get.snackbar("Success", "Coupon");
      isLoading(false);
    }
  }
  // subtotal in address page
  void getSubTotalApi() async{
    isLoading(true);
    getSubTotalModel = await ApiProvider.SubTotalApi();
    if(getSubTotalModel?.newmodeld != null){
      isLoading(false);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getCouponListApi();
    getSubTotalApi();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
}