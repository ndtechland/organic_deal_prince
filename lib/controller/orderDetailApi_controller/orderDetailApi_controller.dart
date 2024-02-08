import 'package:get/get.dart';
import 'package:organic_deal/model/cancelOrder_model.dart';
import 'package:organic_deal/model/orderDetailPage_model.dart';
import 'package:organic_deal/services/api_provider.dart';
import 'package:http/http.dart' as http;

class OrderDetailApiController extends GetxController{
  RxBool isLoading = false.obs;
  OrderDetailPageModel? getOrderDetailPageModel;
  CancelOrderModel? cancelOrderModel;
  void orderDetailApi() async{
    isLoading(true);
    getOrderDetailPageModel = await ApiProvider.OrderDetailPage();
    if(getOrderDetailPageModel?.newmodel?.cartlist != null){
      isLoading(false);
  }else{
    }
}
// post api
  void CancelOrderApi(var orderno) async{
    isLoading(true);
    http.Response r = await ApiProvider.CancelOrderApi(orderno);
    if(r.statusCode==200){
      isLoading(false);
    }
  }
  void getCancelOrderListApi() async{
    isLoading(true);
    cancelOrderModel = await ApiProvider.OrderCancelApi();
    if(cancelOrderModel?.ordList != null){
      isLoading(false);
    }
  }
@override
  void onInit() {
  orderDetailApi();
  getCancelOrderListApi();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}