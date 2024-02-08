import 'package:get/get.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/my_wallet_controller/my_wallet_controller.dart';
import 'package:organic_deal/controller/postOrder_controller/postOrder_controller.dart';
import 'package:organic_deal/controller/userProfile_controller/userProfile_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RozarpayController extends GetxController{
  RxBool isLoading = false.obs;
  late Razorpay _razorpay;
  final CartListApiController _cartListApiController = Get.put(CartListApiController());
  UserProfileController _userProfileController = Get.put(UserProfileController());
  PostOrderController _postOrderController = Get.put(PostOrderController());
  MyWalletController _walletController = Get.put(MyWalletController());

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() async {
    double? p=_cartListApiController.getCartListModel?.newmodel?.totalprice?.toDouble();
    int price = p!.toInt(); // i = 20
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount': int.parse('${price}') * 100,
      'name': _userProfileController.getuserProfileModel?.fullName.toString(),
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact': _userProfileController.getuserProfileModel?.phone,
        'email': _userProfileController.getuserProfileModel?.emailId.toString(),
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
    }
  }
  // void handlerPaymentSuccess() {
  //   Get.to(Itemsbuy());
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("SUCCESS", "ID: ${response.paymentId}");
    print('payment sucess');
// online payment...
    _postOrderController.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
       // _medicineHistoryController.medicineorderhistoryApi();

        ///nov 14....................................
        // Get.to(LabHistoryUser());
      //  Get.to(UserHomePage());
      //  _medicineHistoryController.update();
      } else {
        // SHow
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
        "ERROR", "CODE: ${response.code}  MESSAGE:${response.message}");

    print('payment fail');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("EXTERNAL WALLET", "WALLET NAME: ${response.walletName}");
  }
}