import 'package:get/get.dart';
import 'package:organic_deal/model/orderHistoryApi_model.dart';
import 'package:organic_deal/services/api_provider.dart';

class MyOrderHistoryController extends GetxController{
  RxBool isLoading = false.obs;
  OrderHistoryApiModel? getorderHistoryApiModel;
  void getOrderHistoryApi() async{
    isLoading(true);
    getorderHistoryApiModel = await ApiProvider.OrderHistoryApi();
    if(getorderHistoryApiModel?.result != null){
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getOrderHistoryApi();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}