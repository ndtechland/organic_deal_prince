import 'package:get/get.dart';
import 'package:organic_deal/model/cartListApiModel/cartListApi_model.dart';
import 'package:organic_deal/services/api_provider.dart';
import 'package:http/http.dart' as http;

class CartListApiController extends GetxController{
  RxBool isLoading = false.obs;
  CartListModel? getCartListModel;
  void getCartListApi() async{
    isLoading(true);
    getCartListModel = await ApiProvider.CartListApi();
    if(getCartListModel?.newmodel?.cartList != null){
      isLoading(false);
    }
  }
  void removeCartListApi(productId) async{
   // isLoading(true);
    http.Response r = await ApiProvider.RemoveListItemApi(productId);
    if(r.statusCode == 200){
     // isLoading(false);
    }else{
    }
  }
  void incrementCartItemApi(productId) async{
   // isLoading(true);
    http.Response r = await ApiProvider.IncrementQuantityApi(productId);
    if(r.statusCode== 200){
    //  isLoading(false);
    }else{
    }
  }
  void decrementCartItemApi(productId) async{
   // isLoading(true);
    http.Response r = await ApiProvider.DecrementQuantityApi(productId);
    if(r.statusCode==200){
    //  isLoading(false);
    }else{
    }
  }
  @override
  void onInit() {
   getCartListApi();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
}