import 'package:get/get.dart';
import 'package:organic_deal/model/subProducts_model/subproduct_model.dart';
import 'package:organic_deal/services/api_provider.dart';
import 'package:http/http.dart' as http;

class SubProductController extends GetxController {
  RxBool isLoading = false.obs;
  SubproductsModel? getsubproductsModel;
  void SubProductApi()async{
    isLoading(true);
    getsubproductsModel = await ApiProvider.SubProductsApi();
    if(getsubproductsModel?.products != null){
      isLoading(false);
    }
  }
  void AddToCart(var productId)async{
    isLoading(true);
    http.Response r = await ApiProvider.AddToCartApi(productId);
    if(r.statusCode == 200){
      isLoading(false);
    }else{
    }
  }

  @override
  void onInit() {
    SubProductApi();
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
