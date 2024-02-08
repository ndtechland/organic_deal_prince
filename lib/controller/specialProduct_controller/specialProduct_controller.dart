import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/model/special_products_model.dart';
import 'package:organic_deal/services/api_provider.dart';
class SpecialProductController extends GetxController{
  var isButtonHide = true.obs;
  RxBool isloading = false.obs;
  SpecialProductModel? specialProductModel;
  //special products
  void specialproductsApi() async{
    isloading(true);
    specialProductModel = await ApiProvider.SpecialProductsApi();
    if(specialProductModel?.specialProducts != null){
      isloading(false);
    }
  }
  void AddToCart(var productId)async{
   // isloading(true);
    http.Response r = await ApiProvider.AddToCartApi(productId);
    if(r.statusCode == 200){
     // isloading(false);
    }else{
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    specialproductsApi();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}