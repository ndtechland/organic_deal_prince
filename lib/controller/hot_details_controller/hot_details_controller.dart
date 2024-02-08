import 'package:get/get.dart';
import 'package:organic_deal/model/hotdetails_model.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/services/api_provider.dart';
class HotDetailsController extends GetxController{
  RxBool isLoading = false.obs;
  ProductModel? gethotDetails;
  //hot details
  void hotdetailsApi() async{
    isLoading(true);
    gethotDetails = await ApiProvider.HotDetailsApi();
    if(gethotDetails != null){
      isLoading(false);
    }
  }
  void AddToCart(var productId)async{
    //isLoading(true);
    http.Response r = await ApiProvider.AddToCartApi(productId);
    if(r.statusCode == 200){
      //isLoading(false);
    }else{
    }
  }
  @override
  void onInit() {
    hotdetailsApi();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}