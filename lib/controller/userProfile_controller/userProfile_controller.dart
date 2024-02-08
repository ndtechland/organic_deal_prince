import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:organic_deal/model/userprofile_model.dart';
import 'package:organic_deal/services/api_provider.dart';

class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;

  UserProfileModel? getuserProfileModel;
  void getUserProfileApi() async {
    isLoading(true);
    getuserProfileModel = await ApiProvider.UserProfile();
    if (getuserProfileModel != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserProfileApi();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
