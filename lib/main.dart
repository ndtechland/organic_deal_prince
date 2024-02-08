
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:organic_deal/controller/cartListApi_controller/cartListApi_controller.dart';
import 'package:organic_deal/controller/hometab_controller/hometab_controller.dart';
import 'package:organic_deal/controller/specialProduct_controller/specialProduct_controller.dart';
import 'package:organic_deal/pages/splash_page.dart';
import 'package:organic_deal/widgets/controller_binding.dart';

// this is rahul 06/10/2023
// this is  rahul 23/10/2023
//for signed apk key0,123456
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    Get.lazyPut(() => HomeTabController());
    Get.lazyPut(() => SpecialProductController());
    Get.lazyPut(() => CartListApiController());

    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  runApp(const MyApp());
}
@override

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        //fontFamily: 'Nunito',
       // primarySwatch: Colors.green.shade600,
      ),
      home:
      const SplashScreen()
      //  SignupPage()
    //  UpdateProfile()
      //RecommendProductPage()
    //  InvoicePage()
    //  IntroPage()
   //   OrderCancelledPage()
    //  BasketTab()
    //  OrderDetailPage()
    //  CancelOrderPage()
     // OrderCancelledPage()
      //ShopCategoryPage(title: '')
      //FaqDrawer()
      //PrivacyPolicy()
      //NotificationDrawer()
     // ProfilePageDrawer()
      //AddNewAddress()
     // HotDetails()
     // const HomePage()
      //BulkOrderDrawer()
     // SpecialProducts()
     // MyWallet()
     //  CustomerSupportDrawer()
     // BasketTab()
     // const IntroPage(),
    //  ChooseDeliveryAddressPage()
    );
  }
}
