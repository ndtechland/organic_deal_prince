import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:organic_deal/services/api_provider.dart';

class PostOrderController extends GetxController{
  RxBool isLoading = false.obs;
  Future<int> postOrderApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.OrderSuccessApi();
    if (r.statusCode == 200) {
      isLoading(false);
      // Get.to(() => NavBar());
    }
    return r.statusCode;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}